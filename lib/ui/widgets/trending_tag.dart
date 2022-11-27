import 'package:flutter/material.dart';

import '../../services/utils/constants/constants.dart';

class TrendingTag extends StatelessWidget {
  const TrendingTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'پرطرفدار',
          style: TextStyle(
            fontFamily: 'SB',
            fontSize: 10,
            color: CustomColors.mainOrange,
          ),
        ),
      ),
    );
  }
}
