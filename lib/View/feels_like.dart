import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/current_feels_like.dart';

class FeelsLikePage extends StatelessWidget {
  final String? location;
  final int? feelsLike;

  FeelsLikePage({super.key, this.location, this.feelsLike});

  // Icon
  final Icon feelsLikeIcon = Icon(
    CustomFAIcons.feelsLikeFAIcon,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: CustomAppColors.appBarColor,
        ),
        centerTitle: true,
        title: const Text("Feels Like", style: CustomTextStyle.appBarFont),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.lightBlueAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    border: Border()),
                child:
                    currentFeelsLike(feelsLikeIcon, '$feelsLike', '$location')),
          ),
        ],
      ),
    );
  }
}
