import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyThemes.darkBluish).make(),
        "Trending Products".text.xl2.color(MyThemes.darkBluish).make(),
      ],
    );
  }
}