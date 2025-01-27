import 'package:get/get.dart';
import '../models/item_model.dart';

class ItemController extends GetxController {
  var items = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    items.value = [
      ItemModel(title: 'Item 1', imagePath: 'assets/images/item1.png'),
      ItemModel(title: 'Item 2', imagePath: 'assets/images/item2.png'),
      ItemModel(title: 'Item 3', imagePath: 'assets/images/item3.png'),
    ];
  }
}
