import 'package:flutter/material.dart';
import '../widgets/text_input_widget.dart';

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});
  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final TextEditingController _enamilController = TextEditingController();
  final TextEditingController _passWordcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _userNamecontroller = TextEditingController();

  @override
  void dispose() {
    // We have to dispose or clear these controllers widgets as soon as th widgets gets disposed or clear
    super.dispose();
    _enamilController.dispose();
    _passWordcontroller.dispose();
    _biocontroller.dispose();
    _userNamecontroller.dispose();
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
          // Image (LOGO)
          SizedBox(height: 200, width: 250, child: Image.asset('assets/icons8-instagram-100.png', color: Colors.white)),

          //Circluar widget to accpet and showu our selected file
          Stack(
            children: [
              const CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1682232860597-9e16a4972602?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
              ),
              Positioned(
                bottom: -10,
                left: 80,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                      )))
            ],
          ),
          const SizedBox(height: 25),

          //TextFiledInput for user name
          TextInputWidget(
            hintText: 'Enter your username',
            textInputType: TextInputType.text,
            textEditingController: _userNamecontroller,
          ),
          const SizedBox(height: 25),

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

          //BIO conrtoller
          TextInputWidget(
            hintText: 'Enter your bio',
            textInputType: TextInputType.text,
            textEditingController: _biocontroller,
          ),
          const SizedBox(height: 25),

          // Button for Login
          InkWell(
            onTap: () {},
            child: Container(
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), color: Colors.blue),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text('Sign Up'),
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
