import 'package:flutter/material.dart';
import 'package:real_estate/shared/custom_btn.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/test/house1.png",
      "title": "Modern Villa",
      "desc": "فيلا مودرن بإطلالة رائعة وإضاءة دافئة."
    },
    {
      "image": "assets/test/house2.png",
      "title": "Cozy Home",
      "desc": "منزل مريح مناسب للعائلة في مكان هادئ."
    },
    {
      "image": "assets/test/house3.png",
      "title": "Luxury Apartment",
      "desc": "شقة فخمة بتصميم عصري وإطلالة ساحرة."
    },
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصفحات
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];
              return OnboardingPage(
                image: page["image"]!,
                title: page["title"]!,
                description: page["desc"]!,
              );
            },
          ),

          // الأزرار والمؤشرات
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر Skip
                CustomBtn(
                  text: "Skip",
                  onTap: _skip,
                  width: 80,
                  size: 14,
                ),

                // مؤشرات الصفحات
                Row(
                  children: List.generate(
                    pages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 20 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.brown
                            : Colors.white70,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // زر Next أو Start
                CustomBtn(
                  text: _currentPage == pages.length - 1 ? "Start" : "Next",
                  onTap: _nextPage,
                  width: 100,
                  size: 14,
                  iconImage: "assets/icons/sahm.png",
                  textAlignment: TextAlign.left,

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
