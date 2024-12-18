import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Movie, shows and more',
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 35,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.mic_none,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
