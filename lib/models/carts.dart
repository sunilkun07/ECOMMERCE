import 'catalog.dart';

// Cart Model
class CartModel {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void add(Item item) {
    _items.add(item);
  }

  void remove(Item item) {
    _items.remove(item);
  }

  num get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
}

// Global Cart
final cart = CartModel();
