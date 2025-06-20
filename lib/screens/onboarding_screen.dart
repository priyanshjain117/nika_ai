import 'package:flutter/material.dart';
import 'package:nika_ai/model/onboard.dart';
import 'package:nika_ai/screens/home.dart';
import 'package:nika_ai/widgets/custom_animation.dart';
import 'package:nika_ai/widgets/title_subtitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _savingData();
  }

  Future<void> _savingData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    final pageCtrl = PageController();

    final List<Onboard> list = [
      Onboard(
        title: "Imagination to Reality",
        subtitle:
            "Just Imagine your favourite anime character are talking to you and assisting in your problems",
        animationName: 'dog',
      ),
      Onboard(
        title: "Ask me Anything",
        subtitle:
            "I can be your Best Friend and You can ask me anything & i will help you!",
        animationName: 'girl',
      ),
    ];
    return Scaffold(
        body: PageView.builder(
            controller: pageCtrl,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFC107),
                      Color(0xFFFF5722),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      CustomAnimation(
                        name: list[index].animationName,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TitleSubtitle(
                        title: list[index].title,
                        subtitle: list[index].subtitle,
                      ),
                      Spacer(),
                      Wrap(
                        spacing: 10,
                        children: List.generate(
                          2,
                          (idx) => Container(
                            width: idx == index ? 18 : 10,
                            height: 8,
                            decoration: BoxDecoration(
                                color: idx == index
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color.fromARGB(255, 45, 46, 46),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          elevation: 1,
                        ),
                        onPressed: () {
                          if (index == 0) {
                            pageCtrl.nextPage(
                                duration: Duration(
                                  milliseconds: 600,
                                ),
                                curve: Curves.ease);
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          index == 1 ? "Final" : "Next",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              );
            }));
  }
}
