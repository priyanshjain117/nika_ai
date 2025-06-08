import 'package:flutter/material.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Imagination to Reality",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            "Just Imagine your favourite anime character are talking to you and assisting in your problems",
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }
}
