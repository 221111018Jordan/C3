// Di bagian import
import 'package:flutter/material.dart';
import 'package:uas/components/users.dart';
import 'package:uas/pages/forgotpassword.dart';
import 'package:uas/pages/register.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/widget/CustomTextField.dart';
import 'package:provider/provider.dart';
import 'package:uas/widget/customTextFieldEmail.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool errorActive = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SingleChildScrollView(scrollDirection: Axis.horizontal),
                const SizedBox(height: 50),

                // logo
                Tooltip(
                  message: 'User Icon',
                  child: const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(height: 10),
                CustomTextFieldEmail(
                  obscureText: false,
                  label: "Email",
                  icon: Icons.email,
                  isi: emailC,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  obscureText: true,
                  label: "Password",
                  icon: Icons.visibility_off,
                  isi: passwordC,
                ),

                Center(
                    child: Text(
                  "Email Atau Password Salah",
                  style: TextStyle(
                    color: errorActive ? Colors.red : Colors.grey[300],
                  ),
                )),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),
                      Tooltip(
                        message: 'Lupa Password?',
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPassword();
                            }));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                      width: 300,
                      height: 50,
                      child: Consumer<userListManager>(
                        builder: (context, value, child) {
                          return Tooltip(
                            message: 'Login apabila sudah memiliki akun',
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  bool found = false;
                                  if (emailC.text.isEmpty &&
                                      passwordC.text.isEmpty) {
                                    errorActive = true;
                                  } else {
                                    for (var element in value.listUsers) {
                                      print(element.email);
                                      if (element.email == emailC.text &&
                                          element.passwd == passwordC.text) {
                                        value.changeUser(element);
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    bottonnav(
                                                        currentIndex: 0)));
                                        errorActive = false;
                                        found = true;
                                      }
                                    }
                                  }
                                  if (!found) {
                                    errorActive = true;
                                  }
                                });
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                            ),
                          );
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Tooltip(
                      message: 'Registrasi akun baru mu disini',
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }));
                          },
                          child: const Text(
                            "Register now",
                            style: TextStyle(color: Colors.blue),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
