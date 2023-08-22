import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

Future<void> main(List<String> args) async {
  ReceivePort receivePort = ReceivePort();

  compute(getCurrency, receivePort.sendPort);
  compute(readFile, receivePort.sendPort);


  // final isolate1 = await Isolate.spawn(getCurrency, receivePort.sendPort);
  // final isolate2 = await Isolate.spawn(readFile, receivePort.sendPort);

  // final result = await receivePort.take(2).toList();
  // print(result.first);
  // print(result[1]);

  // isolate1.kill();
  // isolate2.kill();
}

Future<void> getCurrency(SendPort sendPort) async {
  print("Isolate ishladi");
  final httpClient = HttpClient();
  final request = await httpClient
      .getUrl(Uri.parse("https://nbu.uz/en/exchange-rates/json/"));
  final response = await request.close();
  final data = await response.transform(utf8.decoder).join();
  sendPort.send(data);
}

Future<void> readFile(SendPort sendPort) async {
  final readfile = File("video.mp4");
  Uint8List readContent = await readfile.readAsBytes();
  print(readContent);
  sendPort.send(readContent);
}
