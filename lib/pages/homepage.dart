import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import 'product.dart'; // ✅ Product details page
import 'cart.dart'; // ✅ Import CartPage

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsList = products.values.toList(); // Convert map to list

    return Scaffold(
      appBar: AppBar(
        title: "Catalog App".text.semiBold.white.make(),
        centerTitle: true,
        backgroundColor: Vx.purple700,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ✅ Navigate directly to CartPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        backgroundColor: Colors.deepPurpleAccent, // ✅ Changed color
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      drawer: const Mydrawer(),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            final item = itemsList[index];

            return VxBox(
              child: VStack([
                // ✅ Product image with caching
                Hero(
                  tag: Key(item.id.toString()),
                  child: CachedNetworkImage(
                    imageUrl: item.image,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator(color: Colors.purple)),
                    errorWidget: (context, url, error) => const Icon(Icons.error, size: 50),
                  ).box.roundedLg.clip(Clip.antiAlias).make(),
                ),
                8.heightBox,

                // ✅ Product name
                item.name.text.semiBold.center.make(),

                // ✅ Product price
                "\$${item.price}".text.bold.xl.color(Vx.purple700).make(),
                8.heightBox,

                // ✅ Buy Button — non-blocking navigation
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(item: item),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Vx.purple700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: "Buy".text.white.make(),
                ),
              ]).p12(),
            )
                .roundedLg
                .shadowMd
                .color(Vx.gray200)
                .make()
                .p4();
          },
        ),
      ),
    );
  }
}
