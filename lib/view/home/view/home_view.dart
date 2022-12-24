import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/routes/route_service.dart';

import '../../../core/provider/bloc/riddle/riddle_bloc.dart';
import '../../../riddles_games_ru.dart';
import '../../riddles/category/categories.dart';
import '../../riddles/category/categories_image.dart';
import '../home.dart';

class CategoryGridViewBuilder extends R2StatelessWidget {
  CategoryGridViewBuilder({Key? key}) : super(key: key);

  final _route = RouteService();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoriesImage.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 310),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () async {
          context.read<RiddleBloc>().add(AddRiddles(categories[index]));
          _route.goRiddleViewPage(context, categories[index]);
        },
        child: CategoryModelWidget(index: index),
      ),
    );
  }
}
