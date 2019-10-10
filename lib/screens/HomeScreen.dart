import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.AUDIO;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    _controller.text = _extension = '';
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
    print("filename: "+_fileName);
    print("path: " + _path);
  }

  Future<File> localFile() async {
    File file = File(_path);
    List<int> soundBytes = file.readAsBytesSync();
    String base64sound = base64Encode(soundBytes);
    print("base 64: ");
    print(base64sound);
    print("------------");
    print(file.toString());
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Hackaton - Atlântico'),
        ),
        body: new Center(
            child: new Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: new Builder(
                        builder: (BuildContext context) => _loadingPath
                            ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator()
                        ) : _path != null || _paths != null
                            ? new Container(

                          height: 80,
                          child: new Scrollbar(
                              child: new ListView.builder(
                                itemCount: _paths != null && _paths.isNotEmpty ? _paths.length : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final String name = 'Audio selecionado: \n\n' + (_fileName.split("/").last ?? '...');
                                  return new Text(
                                    name,
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              )
                          ),
                        )
                            :
                        new Container(
                          child: Text("Nenhum audio foi selecionado"),
                        ),
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => _openFileExplorer(),
                          child: new Text("Selecionar audio", style: Theme.of(context).textTheme.display1),
                          color: Theme.of(context).primaryColor,
                        ),
                        RaisedButton(
                          child: Text("Gerar resumo", style: Theme.of(context).textTheme.display1),
                          onPressed: (){ localFile(); },
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}