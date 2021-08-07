import 'package:flutter_catalog/core/data.dart';
import 'package:flutter_catalog/models/shopping.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  DataModel dataModel = DataModel.instance;
  Shopping shopping;

  MyStore() {
    this.shopping = Shopping();
    this.shopping.collection = dataModel;
  }
}
