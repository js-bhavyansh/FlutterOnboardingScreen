import 'package:flutter/material.dart';
import 'package:onboarding_screen/home.dart';
import 'package:onboarding_screen/onboarding/onboarding_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewsState();
}

class _OnboardingViewsState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage ? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button
            TextButton(
                onPressed: () => pageController.jumpToPage(controller.items.length - 1),
                child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.teal),
                )
            ),

            // Page Indicator: flutter pub add smooth_page_indicator
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) =>
                  pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn
                  ),
              effect: const WormEffect(
                  dotHeight: 5,
                  dotWidth: 30,
                  activeDotColor: Colors.teal,
                  spacing: 3
              ),
            ),

            // Next Button
            TextButton(
                onPressed: () =>
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn
                    ),
                child: const Text(
                    "Next",
                  style: TextStyle(color: Colors.teal),
                )
            )
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (index) => setState(() => isLastPage = controller.items.length - 1 == index),
        itemCount: controller.items.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(controller.items[index].image, height: 350,),
                    const SizedBox(height: 15),
                    Text(
                        controller.items[index].title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        controller.items[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    )
                  ],
                )
              )
          );
        },
      ),
    );
  }

  // Get Started Button:->
  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.teal
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () async{  // Using async to use shared preference.
            // Shared Preference:
            final pres = await SharedPreferences.getInstance();
            pres.setBool("onboarding", true); // "onboarding" is a key here.
            if(!mounted)return; // After we press get started btn this onboarding value become true.

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Text(
            "Get Started",
            style: TextStyle(color: Colors.white)
          )
      )
    );
  }
}
