import 'package:flutter/material.dart';
import 'package:insta/Resources/auth_method.dart';
import 'package:insta/Responsive%20Design/mobile_screen_layout.dart';
import 'package:insta/Responsive%20Design/responsive_screen_layout.dart';
import 'package:insta/Responsive%20Design/web_screen_layout.dart';
import 'package:insta/Screens/signup_screen.dart';
import 'package:insta/Widgets/text_field.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);
    if (res == 'Success') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const ResponsiveDesignLayout(
          mobileScreenlayout: MobileScreenLayout(),
          webScreenlayout: WebScreenLayout(),
        );
      }));
    } else {
      showSnackbar(res, context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //IMAGE
              //ENTER YOUR EMAIL

              TextFieldInput(
                  textEditingController: _emailcontroller,
                  hinttext: "Enter your Username"),
              const SizedBox(
                height: 22,
              ),
              //ENTER YOUR PASSWORD
              TextFieldInput(
                textEditingController: _passwordcontroller,
                hinttext: "Enter your Password",
                ispass: true,
              ),
              const SizedBox(
                height: 22,
              ),
              //LOGIN BUTTON
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                onPressed: loginUser,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //DONT HAVE ACCOUNT SiGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Don\'t have an account?'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(' Sign Up'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
