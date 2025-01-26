import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ftfl_ui/constants/colors.dart';
import 'package:ftfl_ui/widgets/bottom_clipper.dart';
import 'package:ftfl_ui/widgets/button.dart';

class CarouselPanelWidget extends StatefulWidget {
  final List<String> imageUrls;

  const CarouselPanelWidget({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  _CarouselPanelWidgetState createState() => _CarouselPanelWidgetState();
}

class _CarouselPanelWidgetState extends State<CarouselPanelWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        ClipPath(
          clipper: BottomRightClipper(),
          child: Container(
            color: AppColors.greyColor,
            height: screenHeight * 0.31,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 60,
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: screenHeight *
                        0.45, // Increased height for larger images
                    width: screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        // Dot indicators
        Positioned(
          bottom: screenWidth * 0.12,
          left: screenWidth * 0.45,
          child: Row(
            children: widget.imageUrls.asMap().entries.map((entry) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 15,
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Text(
                "Card Status: ",
                style: TextStyle(color: Colors.black),
              ),
              const Text(
                "Inactive",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const Positioned(
          right: 18,
          bottom: 7,
          child: CustomButton(text: "More"),
        ),
      ],
    );
  }
}
