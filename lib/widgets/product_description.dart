import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  const ProductDescription(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 20),
        Text(
          "\$ $price",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 20),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Enter your Billing Address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue),
            )),
      ],
    );
  }
}
