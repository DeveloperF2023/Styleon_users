import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_constants.dart';
import 'package:shop/core/constants/dimensions.dart';
import 'package:shop/manager/global/app_bar.dart';
import 'package:shop/manager/global/text_app.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "About Us",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextApp(
                    text: "Welcome to StyleOn!",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Container(
                width: screenWidth * .95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextApp(
                        text:
                            "At StyleOn, we're passionate about providing you \nwith the ultimate shopping experience right at your \nfingertips. With our user-friendly mobile app, you \n can discover an extensive range of products, enjoy \nseamless transactions, and benefit from exceptional customer service every \nstep of the way.",
                        fontSize: font16,
                      ),
                    )
                  ],
                ),
              ),
              sizeVertical(height10),
              Row(
                children: [
                  TextApp(
                    text: "Who We Are?",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "Established in 2024, StyleOn has been dedicated to \nrevolutionizing the way you shop online. Our team comprises industry experts committed to delivering innovation, quality, and reliability in every aspect of your shopping journey.",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  TextApp(
                    text: "Our Mission",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "Our mission at StyleOn is simple: to empower you with convenient access to a diverse selection of high-quality products while delivering unparalleled customer satisfaction. We strive to exceed your expectations by continuously enhancing our services and offerings.",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  TextApp(
                    text: "What Sets Us Apart",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "Quality Assurance: We partner with trusted brands and suppliers to ensure that every product meets the highest standards of quality and authenticity.\nExceptional Customer Service: Our dedicated support team is available around the clock to assist you with any inquiries, concerns, or feedback you may have.\nSecure Transactions: Your privacy and security are our top priorities. We utilize state-of-the-art encryption technology to safeguard your personal and financial information.\nInnovative Features: From intuitive search functionalities to personalized recommendations, we're constantly introducing new features to enhance your shopping experience.",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  TextApp(
                    text: "Get in Touch",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "We value your feedback and are always here to assist you. If you have any questions, suggestions, or inquiries, please don't hesitate to contact us at contact@styleon.com or +21253758962.",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  TextApp(
                    text: "Join Us on Social Media",
                    fontSize: font20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "Stay connected with us on social media to stay updated on the latest product releases, promotions, and news. Follow us on StyleOn on Facebook for exclusive offers and exciting content.",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
              sizeVertical(height10),
              Row(
                children: [
                  Expanded(
                    child: TextApp(
                      text:
                          "Thank you for choosing StyleOn for all your shopping needs. We look forward to serving you and exceeding your expectations!",
                      fontSize: font16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
