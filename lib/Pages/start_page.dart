import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger/Pages/login_page.dart';
import 'package:messenger/Variables/variables.dart';

class StartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: myBody(context));
  }

  Widget myBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 3),
          Image.asset(
            'assets/Logo.png',
            height: size.height / 6,
          ),
          Spacer(),
          Text(
            'US_Messenger',
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deffaultPadding, vertical: deffaultPadding / 2),
            child: Text(
              'My first messenger app which contains Telegrams design and some features from Discord and Whatsapp',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  color: darkGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(flex: 3),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height / 8,
                decoration: BoxDecoration(
                  color: darkGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: deffaultPadding),
                child: TextButton(
                  onPressed: () => Navigator.push(
                      // Переход на другую страницу
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                  child: Text(
                    'Start Messanging',
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
