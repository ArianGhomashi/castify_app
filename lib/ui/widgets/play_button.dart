import 'package:castify_app/services/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PlayButton extends StatelessWidget {
  PlayButton({Key? key, required this.size}) : super(key: key);

  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: CustomColors.mainOrange,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Iconsax.play5,
          color: Colors.white,
        ),
      ),
    );
  }
}
