import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:youtube_ui/models/dataset_model.dart';

Future<List<DatasetModel>> ReadJsonData() async {
  final jsondata = await rootBundle.loadString('assets/data/dataset.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => DatasetModel.fromJson(e)).toList();
}
