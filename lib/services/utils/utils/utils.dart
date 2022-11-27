import 'package:castify_app/services/model/audio_book.dart';
import 'package:castify_app/services/model/category_item.dart';
import 'package:castify_app/services/model/custom_banner_slider.dart';
import 'package:castify_app/services/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

List<String> getPageViewTitleList() {
  return [
    '...در هر شرایطی',
    '...در هر جا',
    '...و در هر لحظه کنارته',
  ];
}

List<String> getTagTitleList() {
  return [
    'همه',
    'کتاب',
    'پادکست',
    'مورد علاقه',
    'زنده',
    'موزیک',
  ];
}

List<CustomBannerSlider> getBannerList() {
  return [
    CustomBannerSlider(
        title: 'بررسی اپلیکیشن‌های دوره فلاتر',
        subtitle: 'از جزئیات تا استقبال دانشجویان',
        textColor: Colors.white,
        imagePath: 'assets/images/banner_image_1.png'),
    CustomBannerSlider(
        title: 'انتقال تجربیات برنامه‌نویسی من',
        subtitle: 'گفتگویی صمیمانه با دانشجویان',
        textColor: CustomColors.mainBlack,
        imagePath: 'assets/images/banner_image_2.png'),
  ];
}

List<CategotyItem> getCategoryItems() {
  return [
    CategotyItem(
      title: 'هنر',
      icon: const Icon(
        Iconsax.gallery5,
        color: Colors.white,
      ),
    ),
    CategotyItem(
      title: 'ثروت',
      icon: const Icon(
        Iconsax.dollar_circle4,
        color: Colors.white,
      ),
    ),
    CategotyItem(
      title: 'تکنولوژی',
      icon: const Icon(
        Iconsax.monitor5,
        color: Colors.white,
      ),
    ),
    CategotyItem(
      title: 'سلامتی',
      icon: const Icon(
        Iconsax.health5,
        color: Colors.white,
      ),
    ),
    CategotyItem(
      title: 'کسب و کار',
      icon: const Icon(
        Icons.business_sharp,
        color: Colors.white,
      ),
    ),
    CategotyItem(
      title: 'گیم',
      icon: const Icon(
        Iconsax.game5,
        color: Colors.white,
      ),
    ),
  ];
}

List<AudioBook> getWeeklyTrendAudioBooks() {
  return [
    AudioBook(
        name: 'کیمیاگر',
        author: 'پائولو کوئیلو',
        narrator: 'ابراهیم اسدی',
        imagePath: 'assets/images/kimiagar.jpg'),
    AudioBook(
        name: 'طلسم',
        author: 'استفان چک',
        narrator: 'ابراهیم اسدی',
        imagePath: 'assets/images/telesm.jpg'),
  ];
}

List<AudioBook> getAudioBooksPlaylist() {
  return [
    AudioBook(
      name: 'آهسته سوختن',
      author: 'پابلو مکنزی',
      imagePath: 'assets/images/slow_burn.jpg',
      total: const Duration(minutes: 13, seconds: 33),
      progress: const Duration(minutes: 1, seconds: 16),
    ),
    AudioBook(
      name: 'پرونده',
      author: 'مارتین یانوزای',
      imagePath: 'assets/images/casefile.jpg',
      total: const Duration(minutes: 10, seconds: 00),
      progress: const Duration(minutes: 9, seconds: 34),
    ),
    AudioBook(
      name: 'شلوغی گوش',
      author: 'ارلون وودز',
      imagePath: 'assets/images/ear_hustle.jpg',
      total: const Duration(minutes: 6, seconds: 12),
      progress: const Duration(minutes: 4, seconds: 14),
    ),
  ];
}
