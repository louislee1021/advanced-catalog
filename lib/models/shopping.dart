import 'package:flutter_catalog/core/data.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/item.dart';
import 'package:velocity_x/velocity_x.dart';

class Shopping extends Collection {
  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + (current as Item).price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    this.store.shopping.itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    this.store.shopping.itemIds.remove(item.id);
  }
}
