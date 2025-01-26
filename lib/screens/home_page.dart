import 'package:flutter/material.dart';
import 'package:ftfl_ui/constants/colors.dart';
import 'package:ftfl_ui/widgets/cursol_sliding_panel.dart';
import 'package:ftfl_ui/widgets/wallet_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
        title: Row(
          children: [
            const Text(
              "Card & Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              CarouselPanelWidget(
                imageUrls: [
                  'assets/credit_card_f.png',
                  'assets/credit_card_b.png'
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildCardActivationSection(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              buildWalletCard("Lifeline Card Wallet", "Upcoming EMI/Udhar",
                  4356, Colors.black45),
              buildWalletCard("Lifeline Coin", "Lifeline Magic Coin", 1023,
                  AppColors.primaryColor),
              buildWalletCard(
                  "Cashback Coin", "Add Credit Coin", 876, Colors.red),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardActivationSection(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.black45,
          width: 0.5,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Activate your LifelineCard',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '₹ 3499/- Life Time',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Offer Ends Soon!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '₹ 9999/Year',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08, vertical: 2),
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Activate Now'),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Image.asset(
                  'assets/feature-4.png',
                  height: screenHeight * 0.17,
                  width: screenWidth * 0.30,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              'Our Features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFeatureContainer("Udhar Limit: 74425", screenWidth),
                _buildFeatureContainer("CP EMI Limit: 74425", screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFeatureIcon(
                    Icons.account_balance_wallet, 'Udhar', screenWidth),
                _buildFeatureIcon(Icons.payments, 'CP EMI', screenWidth),
                _buildFeatureIcon(
                    Icons.business, 'Business Funds', screenWidth),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureContainer(String label, double screenWidth) {
    return Container(
      height: 30,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        label,
        style: TextStyle(color: Colors.black54),
      )),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label, double screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 0.15,
          width: screenWidth * 0.2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.black87,
              size: screenWidth * 0.08,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          label,
          style: const TextStyle(
              fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
