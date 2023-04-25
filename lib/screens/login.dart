import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../layouts/default.dart';
import '../providers/box_provider.dart';
import 'package:http/http.dart' as http;

import '../providers/user_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text = "kristians";
    passwordController.text = "admin";
    return Consumer<TimeBoxState>(builder: (context, state, child) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Username"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var url =
                                Uri.http('localhost:8080', 'api/v1/login');
                            var response = await http.post(url, body: {
                              'username': usernameController.text,
                              'password': passwordController.text
                            });

                            int statusCode = response.statusCode;
                            if (!mounted) return;
                            if (statusCode == 200) {
                              const storage = FlutterSecureStorage();

                              var body = jsonDecode(response.body);
                              String token = body['token'];
                              await storage.write(key: 'token', value: token);

                              var user = body['user'];

                              context
                                  .read<ProfileState>()
                                  .setUsername(user["username"]);
                              context
                                  .read<ProfileState>()
                                  .setEmail(user["email"]);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Default()));
                            } else {
                              var body = jsonDecode(response.body);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(body['message'])),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill input')),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
