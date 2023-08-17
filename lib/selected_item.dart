import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_item_provider.dart';

class SelectedItems extends StatefulWidget {
  const SelectedItems({super.key});

  @override
  State<SelectedItems> createState() => _SelectedItemsState();
}

class _SelectedItemsState extends State<SelectedItems> {
  @override
  Widget build(BuildContext context) {
    final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Selected Items',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favouriteItemProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          }
                        },
                        title: Text("Item $index"),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
