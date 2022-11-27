import 'package:castify_app/services/utils/constants/constants.dart';
import 'package:castify_app/services/utils/utils/utils.dart';
import 'package:castify_app/ui/screens/live_screen.dart';
import 'package:castify_app/ui/screens/playlist_screen.dart';
import 'package:castify_app/ui/screens/podcast_screen.dart';
import 'package:castify_app/ui/screens/profile_screen.dart';
import 'package:castify_app/ui/widgets/play_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import '../widgets/audio_slider.dart';
import '../widgets/trending_tag.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  int selectedItem = 0;
  int selectedBottomNavigationBarindex = 3;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontFamily: 'SM',
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'SM',
          fontSize: 12,
        ),
        fixedColor: CustomColors.mainOrange,
        unselectedItemColor: CustomColors.greyColor,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedBottomNavigationBarindex,
        onTap: (value) {
          setState(() {
            widget.selectedBottomNavigationBarindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Iconsax.profile_circle),
            ),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(
                Iconsax.headphone4,
              ),
            ),
            label: 'لیست پخش',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Iconsax.airdrop5),
            ),
            label: 'زنده',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Iconsax.home5)),
            label: 'خانه',
          ),
        ],
      ),
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: const Icon(
          Iconsax.notification_bing4,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Iconsax.search_normal,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: CustomColors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'کستیفای',
          style: TextStyle(
            color: CustomColors.mainOrange,
            fontFamily: 'SB',
            fontSize: 32,
          ),
        ),
      ),
      body: _getlayout().elementAt(widget.selectedBottomNavigationBarindex),
    );
  }

  List<Widget> _getlayout() {
    return [
      const ProfileScreen(),
      const PlaylistScreen(),
      const LiveScreen(),
      _getHomeScreenLayout(),
    ];
  }

  Widget _getHomeScreenLayout() {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 14,
          ),
        ),
        _getTagButtons(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        _getBannerSlider(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 12,
                    color: CustomColors.mainOrange,
                  ),
                ),
                Text(
                  'دسته بندی',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                    color: CustomColors.mainBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        _getCategoryList(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 12,
                    color: CustomColors.mainOrange,
                  ),
                ),
                Text(
                  'پرطرفدارهای هفته',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                    color: CustomColors.mainBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        _getWeeklyTrendAudioBooksSlider(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        _getAudioBooksPlaylistPart()
      ],
    );
  }

  Widget _getAudioBooksPlaylistPart() {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(
          getAudioBooksPlaylist().length,
          (index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PodcastScreen(
                      podcastImagePath:
                          getAudioBooksPlaylist()[index].imagePath,
                      authorName: getAudioBooksPlaylist()[index].author,
                      bookName: getAudioBooksPlaylist()[index].name,
                    ),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              height: 75,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 23,
                    spreadRadius: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 8, top: 8, bottom: 8),
                child: Row(
                  children: [
                    PlayButton(size: 40),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 100,
                      height: 7,
                      child: AudioSlider(
                        total: getAudioBooksPlaylist()[index].total!,
                        progress: getAudioBooksPlaylist()[index].progress!,
                        barHeight: 3,
                        thumbRadius: 6,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getAudioBooksPlaylist()[index].name,
                          style: const TextStyle(
                            fontFamily: 'SB',
                            fontSize: 14,
                            color: CustomColors.mainBlack,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'اثر: ${getAudioBooksPlaylist()[index].author}',
                          style: const TextStyle(
                            color: CustomColors.mainBlack,
                            fontFamily: 'SM',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          getAudioBooksPlaylist()[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWeeklyTrendAudioBooksSlider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 271,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.9,
          ),
          reverse: true,
          itemCount: getWeeklyTrendAudioBooks().length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PodcastScreen(
                          podcastImagePath:
                              getWeeklyTrendAudioBooks()[index].imagePath,
                          authorName: getWeeklyTrendAudioBooks()[index].author,
                          bookName: getWeeklyTrendAudioBooks()[index].name,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            getWeeklyTrendAudioBooks()[index].imagePath),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        getWeeklyTrendAudioBooks()[index].name,
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            'گوینده: ${getWeeklyTrendAudioBooks()[index].narrator}',
                            style: const TextStyle(
                              fontFamily: 'SB',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'اثر: ${getWeeklyTrendAudioBooks()[index].author}',
                            style: const TextStyle(
                                fontFamily: 'SB',
                                fontSize: 10,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: PlayButton(
                    size: 40,
                  ),
                ),
                const Positioned(
                  top: 18,
                  left: 18,
                  child: Icon(
                    Iconsax.heart5,
                    color: CustomColors.mainOrange,
                  ),
                ),
                const Positioned(
                  top: 16,
                  right: 16,
                  child: TrendingTag(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 77,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: getCategoryItems().length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.mainOrange,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: Center(child: getCategoryItems()[index].icon),
                ),
                const SizedBox(height: 5),
                Text(
                  getCategoryItems()[index].title,
                  style: const TextStyle(
                    fontFamily: 'SB',
                    fontSize: 12,
                    color: CustomColors.mainBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBannerSlider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: PageView.builder(
          reverse: true,
          itemCount: getBannerList().length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  CustomColors.mainOrange,
                  Colors.pink,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(getBannerList()[index].imagePath),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        getBannerList()[index].title,
                        style: TextStyle(
                          color: getBannerList()[index].textColor,
                          fontFamily: 'SB',
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        getBannerList()[index].subtitle,
                        style: TextStyle(
                          color: getBannerList()[index].textColor,
                          fontFamily: 'SM',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: CustomColors.mainBlack,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          child: Text(
                            'مشاهده پادکست',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      Row(
                        children: const [
                          Text(
                            'کستیفای',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 15,
                              color: CustomColors.mainBlack,
                            ),
                          ),
                          Text(
                            ' :اسپانسر',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTagButtons() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 46,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: getTagTitleList().length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedItem = index;
              });
            },
            child: Container(
              height: 46,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: (widget.selectedItem == index)
                    ? CustomColors.mainOrange
                    : CustomColors.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                  vertical: 15,
                ),
                child: Text(
                  getTagTitleList()[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: (widget.selectedItem == index)
                        ? Colors.white
                        : CustomColors.greyColor,
                    fontFamily: 'SB',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
