// Pick all or portions of DataModel
class Collection {
  // DataModel field
  DataModel _dataModel;

  // Collection of IDs - store Ids of each DataItem
  final List<int> itemIds = [];

  // Get DataModel
  DataModel get dataModel => _dataModel;

  set collection(DataModel newDataModel) {
    assert(newDataModel != null);
    _dataModel = newDataModel;
  }

  // Get items in the cart
  List<DataItem> get items =>
      itemIds.map((id) => _dataModel.getById(id)).toList();
}

// Group of DataItem
class DataModel {
  List<DataItem> items;
  // Singleton
  static DataModel _instance;
  static DataModel get instance => _instance ??= new DataModel();
  // /Singleton

  // Get Item by ID
  DataItem getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  DataItem getByPosition(int pos) => items[pos];
}

// Implement this class to use DataModel
abstract class DataItem {
  final int id;

  DataItem({this.id});
}
