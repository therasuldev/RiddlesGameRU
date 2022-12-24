import 'package:flutter/material.dart';

import '../../../riddles_games_ru.dart';
import '../../riddles/category/categories_image.dart';
import '../../riddles/category/categories_name.dart';

class CategoryModelWidget extends R2StatelessWidget {
  CategoryModelWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 250,
            width: 200,
            decoration: CategoryCardDecor(index, categoriesImage[index]),
          ),
          Container(
            height: 45,
            width: 200,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 5),
            child: AutoSizeText(
              categoriesName[index],
              textAlign: TextAlign.center,
              maxLines: 2,
              style: R2Typography.categories.blueGray.size16,
            ),
          ),
        ],
      ),
    );
  }
}
