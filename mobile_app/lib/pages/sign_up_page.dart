import 'package:flutter/material.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:mobile_app/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameContoller = TextEditingController(text: "");

  final TextEditingController userNameContoller =
      TextEditingController(text: "");

  final TextEditingController emailContoller = TextEditingController(text: "");

  final TextEditingController passwordContoller =
      TextEditingController(text: "");

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameContoller.text,
        username: userNameContoller.text,
        password: passwordContoller.text,
        email: emailContoller.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              "Sign-up Failed,please try again",
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
            ),
            const SizedBox(
              height: 2,
            ),
            Text('Register and Happy Shopping', style: subTitleTextStyle)
          ],
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Row(children: [
                  Image.asset(
                    'assets/icon_username.png',
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                          controller: nameContoller,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your Full Name',
                            hintStyle: subTitleTextStyle,
                          ),
                          style: primaryTextStyle))
                ])))
          ],
        ),
      );
    }

    Widget userNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Row(children: [
                  Image.asset(
                    'assets/icon_name.png',
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                          controller: userNameContoller,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your User Name',
                            hintStyle: subTitleTextStyle,
                          ),
                          style: primaryTextStyle))
                ])))
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Row(children: [
                  Image.asset(
                    'assets/icon_email.png',
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                          controller: emailContoller,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your Email Address',
                            hintStyle: subTitleTextStyle,
                          ),
                          style: primaryTextStyle))
                ])))
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Row(children: [
                  Image.asset(
                    'assets/icon_password.png',
                    width: 17,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                          obscureText: true,
                          controller: passwordContoller,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your Password',
                            hintStyle: subTitleTextStyle,
                          ),
                          style: primaryTextStyle))
                ])))
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Already have an account?',
            style: subTitleTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              ' Sign In',
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              inputName(),
              userNameInput(),
              emailInput(),
              passwordInput(),
              isLoading
                  ? LoadingButton(
                      key: UniqueKey(),
                    )
                  : signUpButton(),
              const SizedBox(height: 10),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
