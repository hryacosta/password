import 'dart:convert';
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> fixtureMap(String name) =>
    jsonDecode(File('test/fixtures/$name').readAsStringSync());
