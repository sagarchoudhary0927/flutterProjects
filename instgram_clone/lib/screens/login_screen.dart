import 'package:flutter/material.dart';
import 'package:instgram_clone/util/colors.dart';
import 'package:instgram_clone/util/util.dart';

import '../model/sign_up_auth.dart';
import '../widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _enamilController = TextEditingController();
  final TextEditingController _passWordcontroller = TextEditingController();
  bool _isSigningIn = false;

  @override
  void dispose() {
    // We have to dispose or clear these controllers widgets as soon as teh widgets gets disposed or clear
    super.dispose();
    _enamilController.dispose();
    _passWordcontroller.dispose();
  }

  void loginUser() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(() {
      _isSigningIn = true;
    });
    String res = await SignUpAuth().loginUser(email: _enamilController.text, password: _passWordcontroller.text);
    setState(() {
      _isSigningIn = false;
    });
    if (res != "success") {
      Util.showSnackBar(res, context);
    } else {
       Util.showSnackBar("You have logged In!", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          // Image (LOGO)
          SizedBox(height: 200, width: 250, child: Image.asset('assets/icons8-instagram-100.png', color: Colors.white)),
          // const SizedBox(height: 30),

          // Text Filed for input email
          TextInputWidget(
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _enamilController,
          ),
          const SizedBox(height: 25),

          // Text field input for password
          TextInputWidget(
            hintText: 'Enter your password',
            textInputType: TextInputType.text,
            textEditingController: _passWordcontroller,
            isPass: true,
          ),
          const SizedBox(height: 25),

          // Button for Login
          InkWell(
            onTap: loginUser,
            child: _isSigningIn ? const Center(child: CircularProgressIndicator(
              color: primaryColor,
            ),)
            : Container(
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), color: Colors.blue),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Log In'),
            ),
          ),
          const SizedBox(height: 12),

          Flexible(
            flex: 2,
            child: Container(),
          ),

          //Transitioning to sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text("Don't have an account?"),
              ),
              SizedBox(
                width: 5,
                child: Container(),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Sign up.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }
}
