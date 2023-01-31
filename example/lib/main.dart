import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_attributes/flutter_file_attributes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? filePath;
  Map _fileAttributes = {};
  final _flutterFileAttributesPlugin = FlutterFileAttributes();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getFileAttributes() async {
    if (filePath != null) {
      Map fileAttributes = {};
      try {
        fileAttributes =
            await _flutterFileAttributesPlugin.getFileAttriburtes(filePath!);
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e.message);
        }
      }
      if (!mounted) return;

      setState(() {
        _fileAttributes = fileAttributes;
      });
    } else {
      if (kDebugMode) {
        print('Copy file first');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Text(getPrettyJSONString(_fileAttributes)),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: copyFileToDucmentDirectory,
              child: const Text("Copy file"),
            ),
            ElevatedButton(
              child: const Text('Get  Attributes'),
              onPressed: () {
                getFileAttributes();
              },
            ),
          ],
        ),
      ),
    );
  }

  void copyFileToDucmentDirectory() async {
    var result = await FilePicker.platform.pickFiles();

    if (result == null || result.count < 1) return;

    var documentDirectory = await getApplicationDocumentsDirectory();
    var newFile = await File(result.paths.first!)
        .copy(join(documentDirectory.path, "main.db"));

    setState(() {
      filePath = newFile.path;
    });
  }

  String getPrettyJSONString(jsonObject) {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }
}
