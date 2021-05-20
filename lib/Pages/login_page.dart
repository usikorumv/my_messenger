import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger/Variables/variables.dart';
import 'package:messenger/Pages/home_page.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:  body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.24),
              Text(
                'Login',
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kDeffaultPadding * 3.5,
                    vertical: kDeffaultPadding),
                child: Text(
                  'Please confirm your account and your password.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      color: kLightGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: kDeffaultPadding),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: size.height * 0.57,
                    decoration: BoxDecoration(
                      color: kDarkGreyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDeffaultPadding * 2.5),
                    child: Column(
                      children: [
                        LoginInputField(
                          icon: Icon(Icons.person),
                          textOfField: 'Your Account',
                          myController: accountFieldController,
                          isPasswordField: false,
                        ),
                        SizedBox(height: kDeffaultPadding),
                        LoginInputField(
                          icon: Icon(Icons.lock),
                          textOfField: 'Your Password',
                          myController: passwordFieldController,
                          isPasswordField: true,
                        ),
                        SizedBox(height: kDeffaultPadding * 1.7),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                // Переход на другую страницу
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Image.asset(
                            'assets/LoginButton.png',
                            height: size.height / 8,
                          ),
                        ),
                        SizedBox(height: kDeffaultPadding * 2.5)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginInputField extends StatelessWidget {
  final String textOfField;
  final Widget icon;
  final bool isPasswordField;
  final onChanged;
  final onVisible;

  LoginInputField(
      {this.onVisible,
      this.onChanged,
      this.textOfField,
      this.icon,
      this.isPasswordField});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: deffaultPadding / 4, horizontal: deffaultPadding),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: textOfField,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          prefixIcon: icon,
          suffixIcon: isPasswordField
              ? IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: onVisible,
                )
              : SizedBox(),
        ),
        style: TextStyle(
          color: Color.fromRGBO(38, 37, 38, 1),
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        obscureText: isPasswordField ? true : false,
      ),
    );
  }
}

class SignUpPopUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container();
  }
}
