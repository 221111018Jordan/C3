import 'package:flutter/material.dart';
import 'package:uas/components/my_textfield.dart';
import 'package:uas/pages/login_page.dart';
import 'package:uas/pages/register.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // logo
              Tooltip(
                message: 'User Icon',
                child: const Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20),
              Text(
                'Confirm Your Account',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Tooltip(
                    message: 'Konfirmasi',
                    child: ElevatedButton(
                      onPressed: () {
                        // Pengecekan apakah field username dan password kosong
                        if (usernameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        } else {
                          // Menampilkan pesan jika salah satu atau kedua field kosong
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "Username and/or Email cannot be empty."),
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
                        "Confirm",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ),
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
                  ],
                ),
              ),
              Tooltip(
                message: 'Registrasi akun apabila belum ada',
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                  child: Text(
                    "Don't Have Account? Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
