import 'package:castify_app/services/utils/utils/utils.dart';
import 'package:castify_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../services/utils/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: CustomColors.mainOrange,
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(
            top: 10,
            left: 24,
            child: Image.asset('assets/images/welcome_screen_dots.png'),
          ),
          Positioned(
            bottom: 10,
            right: 24,
            child: Image.asset('assets/images/welcome_screen_dots.png'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'کستیفای',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SB',
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 520,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 3,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Text(
                          getPageViewTitleList()[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SB',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Image.asset(
                              'assets/images/welcome_screen_pageview_image_$index.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 3,
                  effect: const WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white24,
                  ),
                ),
                const SizedBox(height: 33),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 74),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Expanded(
                          child: Text(
                            'شروع کنید',
                            style: TextStyle(
                              color: CustomColors.mainBlack,
                              fontFamily: 'SB',
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(
                          Iconsax.arrow_circle_right5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
