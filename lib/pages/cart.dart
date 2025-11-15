import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/carts.dart'; // <-- Use the global cart

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: "Your Cart".text.white.make(),
        backgroundColor: Vx.purple700,
      ),
      body: Column(
        children: [
          Expanded(child: CartList(onUpdate: refresh)),
          const Divider(),
          CartTotal(onUpdate: refresh),
        ],
      ),
    );
  }

  void refresh() => setState(() {});
}

class CartList extends StatelessWidget {
  final VoidCallback onUpdate;
  const CartList({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    if (cart.items.isEmpty) {
      return const Center(
        child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
      );
    }

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        final item = cart.items[index];
        return ListTile(
          leading: Image.network(
            item.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: item.name.text.make(),
          subtitle: "\$${item.price}".text.make(),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              cart.remove(item);
              onUpdate();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item.name} removed from cart")),
              );
            },
          ),
        );
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  final VoidCallback onUpdate;
  const CartTotal({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "Total: \$${cart.totalPrice}".text.xl.bold.make(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Vx.purple700,
              foregroundColor: Colors.white,
            ),
            child: "Buy".text.make(),
          ),
        ],
      ),
    );
  }
}
