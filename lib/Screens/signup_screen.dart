import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/Resources/auth_method.dart';
import 'package:insta/Responsive%20Design/mobile_screen_layout.dart';
import 'package:insta/Responsive%20Design/responsive_screen_layout.dart';
import 'package:insta/Responsive%20Design/web_screen_layout.dart';
import 'package:insta/Widgets/text_field.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _biocontroller.dispose();
  }

  void selectedImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signupUser(
        email: _emailcontroller.text,
        username: _usernamecontroller.text,
        password: _passwordcontroller.text,
        bio: _biocontroller.text,
        file: _image!);
    if (res != 'Success') {
      showSnackbar(res, context);
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const ResponsiveDesignLayout(
          mobileScreenlayout: MobileScreenLayout(),
          webScreenlayout: WebScreenLayout(),
        );
      }));
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
              Flexible(flex: 2, child: Container()),
              //IMAGE

              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 66,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 66,
                          backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: selectedImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              //ENTER YOUR USERNAME
              TextFieldInput(
                textEditingController: _usernamecontroller,
                hinttext: "Enter your Username",
              ),
              const SizedBox(
                height: 22,
              ),
              //ENTER YOUR EMAIL
              TextFieldInput(
                textEditingController: _emailcontroller,
                hinttext: "Enter your Email",
              ),
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
              //ENTER YOUR Bio
              TextFieldInput(
                textEditingController: _biocontroller,
                hinttext: "Enter your Bio",
              ),
              const SizedBox(
                height: 22,
              ),
              //SiGNUP BUTTON
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                onPressed: signUpUser,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text(
                        "Signup",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //Already HAVE ACCOUNT Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Already have an account?'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(' Login'),
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
