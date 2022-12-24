import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../utils/decorations/decorations.dart';
import '../../widgets/widgets.dart';

class RiddlesCard extends R2StatelessWidget {
  RiddlesCard({
    Key? key,
    required this.childAns,
    required this.childRid,
  }) : super(key: key);
  final Widget childRid;
  final Widget childAns;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .81,
      width: MediaQuery.of(context).size.width,
      decoration: RiddleShowCardDecor(
        color: Theme.of(context).cardColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: SvgPicture.asset(Assets.svg.bcg,
                color: Theme.of(context).hoverColor),
          ),
          Positioned(
            left: -100,
            top: 70,
            child: SvgPicture.asset(
              Assets.svg.back,
              color: Theme.of(context).shadowColor,
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * .74,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: childRid,
            ),
          ),
          Positioned(
            bottom: -30,
            child: childAns,
          ),
        ],
      ),
    );
  }
}
