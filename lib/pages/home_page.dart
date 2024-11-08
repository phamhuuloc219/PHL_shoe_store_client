import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phl_shoe_store_client/pages/login_page.dart';
import 'package:phl_shoe_store_client/pages/product_description.dart';
import 'package:phl_shoe_store_client/widgets/drop_down_btn.dart';
import 'package:phl_shoe_store_client/widgets/multi_select_drop_down.dart';
import 'package:phl_shoe_store_client/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PHL Shoe Stores'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(LoginPage());
              }),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Chip(label: Text('Category')),
                );
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                  items: ["RS: Low to high", "Rs: High to low"],
                  onSelected: (selected) {},
                  selectedItemText: "Sort",
                ),
              ),
              Flexible(
                  child: MultiSelectDropDown(
                onSelectionChanged: (selectedItems) {},
                items: ["Rs: Low to high", "Rs: High to low"],
              )),
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: "Nike Pegasus",
                    imageUrl:
                        "https://media.gettyimages.com/id/506922838/photo/nike-pegasus-design-shoes-and-logo.jpg?s=612x612&w=0&k=20&c=By0UzuxrGvTiQ4sW4OhFBxxbPfbnida2jkH-yNwXqkk=",
                    price: 200,
                    offerTag: "30% off",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDescriptionPage(),
                          ));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
