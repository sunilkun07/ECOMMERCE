import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/catalog.dart';
import '../models/carts.dart'; // <-- Important

class ProductDetailPage extends StatelessWidget {
  final Item item;

  const ProductDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: item.name.text.make(),
        backgroundColor: Vx.purple700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: VStack([
          Hero(
            tag: Key(item.id),
            child: CachedNetworkImage(
              imageUrl: item.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          16.heightBox,
          item.name.text.xl3.bold.make().px16(),
          8.heightBox,
          "\$${item.price}".text.xl2.bold.color(Vx.purple700).make().px16(),
          16.heightBox,
          item.desc.text.center.make().p16(),
        ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.xl2.bold.color(Vx.purple700).make(),
            ElevatedButton.icon(
              onPressed: () {
                cart.add(item); // ✅ Add to cart

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} added to cart!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Vx.purple700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
