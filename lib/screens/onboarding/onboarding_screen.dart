import 'package:expandz/constants/colors.dart';
import 'package:expandz/data/onboarding_data.dart';
import 'package:expandz/screens/onboarding/front_page.dart';
import 'package:expandz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expandz/screens/user_data_screen.dart';
import 'package:expandz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //Page controller
  final PageController _controller = PageController();

  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  //onboarding screens
                  PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        showDetailsPage = value ==
                            3; //show details becomes true if value is equals to 3
                      });
                    },
                    children: [
                      const FrontPage(),
                      SharedOnboardingScreen(
                        title: OnboardingData.onbardingDataList[0].title,
                        imagePath:
                            OnboardingData.onbardingDataList[0].imagePath,
                        description:
                            OnboardingData.onbardingDataList[0].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onbardingDataList[1].title,
                        imagePath:
                            OnboardingData.onbardingDataList[1].imagePath,
                        description:
                            OnboardingData.onbardingDataList[1].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onbardingDataList[2].title,
                        imagePath:
                            OnboardingData.onbardingDataList[2].imagePath,
                        description:
                            OnboardingData.onbardingDataList[2].description,
                      ),
                    ],
                  ),
                  //Page Indicators
                  Container(
                    alignment: const Alignment(0, 0.75),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      // ignore: prefer_const_constructors
                      effect: WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kLightGrey,
                      ),
                    ),
                  ),

                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: GestureDetector(
                          onTap: () {
                            if (showDetailsPage == true) {
                              //Navigate to the userdata page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDataScreen(),
                                  ));
                            } else {
                              _controller.animateToPage(
                                (_controller.page)!.toInt() + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: CustomButton(
                            buttonName:
                                showDetailsPage ? "Get Started" : "Next",
                            buttonColor: kMainColor,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
