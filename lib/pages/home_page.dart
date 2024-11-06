import 'package:flutter/material.dart';
import 'package:phl_shoe_store_client/widgets/drop_down_btn.dart';
import 'package:phl_shoe_store_client/widgets/multi_select_drop_down.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PHL Shoe Stores'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () {}),
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
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  );
                }),
          )
        ],
      ),
    );
  }
}
