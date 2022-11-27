import 'dart:ui';

import 'package:castify_app/ui/widgets/audio_slider.dart';
import 'package:castify_app/ui/widgets/play_button.dart';
import 'package:castify_app/ui/widgets/trending_tag.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/utils/constants/constants.dart';

class PodcastScreen extends StatelessWidget {
  PodcastScreen(
      {Key? key,
      required this.podcastImagePath,
      required this.bookName,
      required this.authorName})
      : super(key: key);

  String podcastImagePath;
  String bookName;
  String authorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: const [
              Icon(
                Iconsax.add_circle,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Icon(
                Iconsax.heart,
                color: Colors.black,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Iconsax.arrow_circle_right,
                color: Colors.black,
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: CustomColors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'پادکست',
          style: TextStyle(
            color: CustomColors.mainOrange,
            fontFamily: 'SB',
            fontSize: 32,
          ),
        ),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          _getPodcastBanner(),
          Expanded(
            child: Container(
              color: const Color.fromRGBO(245, 245, 245, 1),
              child: Center(
                child: ListView(
                  children: [
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _getAudioSlider(),
                    ),
                    const SizedBox(height: 40),
                    _getPodcastButtons(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'کتاب الکترونیکی',
                            style: TextStyle(
                              color: CustomColors.mainBlack,
                              fontFamily: 'SB',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _getPodcastEpisodes(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAudioSlider() {
    return AudioSlider(
        total: const Duration(minutes: 44),
        progress: const Duration(minutes: 13, seconds: 36),
        barHeight: 8,
        thumbRadius: 10);
  }

  Widget _getPodcastEpisodes() {
    return Column(
        children: List.generate(
      6,
      (index) => Container(
        margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        height: 75,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.02),
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 23,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.02),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              PlayButton(size: 40),
              const SizedBox(width: 15),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${index + 1}قسمت',
                    style: const TextStyle(
                      fontFamily: 'SB',
                      fontSize: 14,
                      color: CustomColors.mainBlack,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bookName,
                    style: const TextStyle(
                      color: CustomColors.mainBlack,
                      fontFamily: 'SM',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              SizedBox(
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    podcastImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _getPodcastButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Iconsax.music_playlist,
          color: CustomColors.greyColor,
          size: 50,
        ),
        const Icon(
          Iconsax.backward_10_seconds,
          color: CustomColors.greyColor,
          size: 50,
        ),
        PlayButton(size: 60),
        const Icon(
          Iconsax.forward_10_seconds,
          color: CustomColors.greyColor,
          size: 50,
        ),
        const Icon(
          Iconsax.timer_1,
          color: CustomColors.greyColor,
          size: 50,
        ),
      ],
    );
  }

  Widget _getPodcastBanner() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              podcastImagePath,
            ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(245, 244, 244, 0.2),
                      Color.fromRGBO(245, 245, 245, 1),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 70,
                  left: 70,
                  top: 50,
                  bottom: 80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      podcastImagePath,
                    ),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      offset: Offset(0, 8),
                      blurRadius: 17,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Column(
                  children: [
                    Text(
                      bookName,
                      style: const TextStyle(
                        color: CustomColors.mainBlack,
                        fontFamily: 'SB',
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          'قسمت 1',
                          style: TextStyle(
                            color: CustomColors.greyColor,
                            fontFamily: 'SM',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'اثر: $authorName',
                          style: const TextStyle(
                            color: CustomColors.greyColor,
                            fontFamily: 'SM',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(top: 25, child: TrendingTag())
            ],
          ),
        ),
      ),
    );
  }
}
