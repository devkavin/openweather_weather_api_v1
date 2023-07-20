import 'package:flutter/material.dart';
import '../widgets/constants.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const Search({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(0),
        // gradient: const LinearGradient(
        //   colors: [
        //     Color.fromARGB(139, 255, 255, 255),
        //     Color.fromARGB(0, 255, 255, 255),
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: TextField(
          controller: controller,
          style: CustomTextStyle.searchFont,
          cursorColor: CustomAppColors.textColor,
          cursorOpacityAnimates: true,
          cursorHeight: 25,
          cursorRadius: const Radius.circular(50),
          decoration: const InputDecoration(
              hintText: 'Search City..',
              hintStyle: CustomTextStyle.searchFont,
              contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              prefixIcon: Icon(
                Icons.search,
                color: CustomAppColors.textColor,
              ),
              border: OutlineInputBorder(
                // style when not clicked
                // invisible border
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                // style when clicked
                borderRadius: BorderRadius.all(Radius.circular(50)),
              )),
          onSubmitted: onSubmitted,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}
