import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../services/utils/constants/constants.dart';

class AudioSlider extends StatelessWidget {
  AudioSlider(
      {Key? key,
      required this.total,
      required this.progress,
      required this.barHeight,
      required this.thumbRadius})
      : super(key: key);

  Duration total;
  Duration progress;
  double barHeight;
  double thumbRadius;

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
        timeLabelTextStyle: const TextStyle(
          fontFamily: 'SB',
          fontSize: 12,
          color: CustomColors.greyColor,
        ),
        barHeight: barHeight, //,
        thumbRadius: thumbRadius, //,
        thumbColor: CustomColors.mainOrange,
        progressBarColor: CustomColors.mainOrange,
        baseBarColor: CustomColors.greyColor,
        progress: progress, //,
        total: total //,
        );
  }
}
