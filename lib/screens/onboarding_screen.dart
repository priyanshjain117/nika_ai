import 'package:flutter/material.dart';
import 'package:nika_ai/model/onboard.dart';
import 'package:nika_ai/widgets/custom_animation.dart';
import 'package:nika_ai/widgets/title_subtitle.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, this.animateionName = 'dog'});
  final String animateionName;

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
              CustomAnimation(
                name: animateionName,
              ),
              const SizedBox(
                height: 40,
              ),
              TitleSubtitle(),
              const SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(
                  2,
                  (index) => Container(
                    width: 10,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  elevation: 1,
                ),
                onPressed: () {},
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
