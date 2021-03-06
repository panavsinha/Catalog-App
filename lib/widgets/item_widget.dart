import 'package:flutter/material.dart';
import 'package:flutter_practice/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item;
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () {
          print("${item!.name} pressed");
        },
        leading: Image.network(item!.image),
        title: Text(item!.name),
        subtitle: Text(item!.desc),
        trailing: Text(
          "\$${item!.price}",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
