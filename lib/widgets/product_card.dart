import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String offerTag;
  final Function onTap;
  const ProductCard(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.offerTag,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 120,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              "Rs: $price",
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.green,
              ),
              child: Text(
                offerTag,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
