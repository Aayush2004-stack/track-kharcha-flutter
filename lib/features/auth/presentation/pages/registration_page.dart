import 'package:flutter/material.dart';
import 'package:track_kharcha/core/customs/custom_text.dart';
import 'package:track_kharcha/features/auth/custom_text_form_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF4F8),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Container(
            constraints: BoxConstraints(maxWidth: 550),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff0F766E),
                        child: Icon(Icons.trending_up, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Track Kharcha",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  CustomText(
                    text: "Create your account",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  SizedBox(height: 20),

                  CustomText(
                    text: "Start tracking smarter in under a minute.",
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),

                  SizedBox(height: 25),

                  // TextButton.icon(
                  //   onPressed: () => Navigator.pop(context),
                  //   icon: Icon(Icons.arrow_back, color: Colors.black),
                  //   label: CustomText(text: "Back"),
                  // ),
                  SizedBox(height: 15),

                  CustomTextFormField(
                    label: "Name",
                    hintText: "Your Name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  CustomTextFormField(
                    label: "Email",
                    hintText: "Your Email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains("@")) {
                        return "Enter a valid email with @";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  CustomTextFormField(
                    label: "Password",
                    hintText: "******",
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be of 6 characters";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  CustomTextFormField(
                    label: "Confirm Password",
                    hintText: "******",
                    controller: confirmController,
                    isPassword: true,
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0F766E),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Registration successful!");
                        }
                      },
                      child: Text("Register", style: TextStyle(fontSize: 18)),
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color(0xff0F766E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
