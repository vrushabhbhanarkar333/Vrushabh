import 'package:flutter/material.dart';
import 'package:ftfl_ui/constants/colors.dart';
import 'package:ftfl_ui/widgets/bottom_clipper.dart';
import 'package:ftfl_ui/widgets/button.dart';

Widget buildWalletCard(
    String title, String subtitle, double balance, dynamic subTitle) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipPath(
          clipper: BottomRightClipper(),
          child: Container(
            height: 130,
            width: double.infinity,
            color: AppColors.greyColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 25,
                          )
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 15,
                              color: subTitle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "${balance.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${balance.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 25,
        bottom: 12,
        child: Row(
          children: [
            Text.rich(
              TextSpan(
                text: '11',
                style: const TextStyle(
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: 'th ',
                    style: const TextStyle(
                      color: Colors.black87,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Sep 2023 To 11 Oct 2023",
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
      const Positioned(
        right: 25,
        bottom: 12,
        child: CustomButton(text: "More"),
      ),
    ],
  );
}
