import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/favourite_item_provider.dart';
import 'package:provider_state_management/selected_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    print("Build");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Provider State Management',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectedItems(),
                    ));
              },
            )
          ],
          //automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
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
