import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/components/users.dart';
import 'package:uas/pages/login_page.dart';
import '../components/my_textfield.dart';

class Register extends StatefulWidget {
  Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool errorActive = false;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SingleChildScrollView(scrollDirection: Axis.horizontal),
                const SizedBox(height: 30),
                const Icon(
                  Icons.person,
                  size: 100,
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 20),
                Text(
                  'Register Your Account',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
            
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 25),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Consumer<userListManager>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              errorActive = false;
                              added = false;
                              for (var element in value.listUsers) {
                                if (element.email == emailController.text) {
                                  errorActive = true;
                                }
                              }
                              if (!errorActive) {
                                value.addUser(
                                    usernameController.text,
                                    emailController.text,
                                    passwordController.text);
                                added = true;
                              }
                            });
                            // Pengecekan apakah field username dan password kosong
                            if (usernameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              value.addUser(usernameController.text,
                                  emailController.text, passwordController.text);
                            } else {
                              // Menampilkan pesan jika salah satu atau kedua field kosong
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "Username and/or Email and/or password cannot be empty."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                        );
                      },
                    ),
                  ),
                ),
            
                SizedBox(
                  height:20,
                ),
                Center(
                    child: Text(
                  "Akun sudah terdaftar",
                  style: TextStyle(
                    color: errorActive ? Colors.red : Colors.grey[300],
                    // color: errorActive ? Colors.red : Colors.white,
                  ),
                )),
                Center(
                    child: Text(
                  "Akun berhasil terdaftar",
                  style: TextStyle(
                    color: added ? Colors.black : Colors.grey[300],
                    // color: errorActive ? Colors.red : Colors.white,
                  ),
                )),
            
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
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Back To Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}