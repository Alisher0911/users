import 'package:flutter/material.dart';
import 'package:makit/consts/colors.dart';
import 'package:makit/presentation/users/users_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonEnabled = false;


  void listenControllers(){
    setState(() {
      if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
        _isButtonEnabled = false;
      } else {
        _isButtonEnabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: BackgroundImageClipper(),
              child: Image.asset(
                "assets/background.png",
                fit : BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ), 

          // Login Container
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                const Text(
                  "Вход",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.fromLTRB(49, 75, 49, 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      // Email field
                      TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          listenControllers();
                        },
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 16, color: textFieldLabelColor),
                          floatingLabelStyle: TextStyle(fontSize: 14, color: purpleColor),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderSideColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderSideFocusedColor),
                          ),
                        ),
                      ),
              

                      const SizedBox(height: 32),


                      // Password field
                      TextFormField(
                        controller: _passwordController,
                        onChanged: (value) {
                          listenControllers();
                        },
                        obscureText: true,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Пароль",
                          labelStyle: TextStyle(fontSize: 16, color: textFieldLabelColor),
                          floatingLabelStyle: TextStyle(fontSize: 14, color: purpleColor),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderSideColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderSideFocusedColor),
                          ),
                        ),
                      ),


                      const SizedBox(height: 56),


                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          _isButtonEnabled ?
                          Navigator.push(
                            context,
                            UsersScreen.route()
                          )
                          : null;
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 38)),
                          backgroundColor: _isButtonEnabled
                                            ? MaterialStateProperty.all(purpleColor)
                                            : MaterialStateProperty.all(purpleColor.withOpacity(0.5)),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          )
                        ),
                        child: const Text(
                          "Войти",
                          style: TextStyle(fontSize: 16)
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 2/3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}