import 'package:finalhackathon/homescreen.dart';
import 'package:finalhackathon/loginscreen.dart'; // Ensure you import the Loginscreen
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A1B9B), // Lighter Purple-Blue
                Color(0xFF333334), // Dark grey
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Space at the top
              Image.asset("assets/images/logo.png", width: 200),
              const SizedBox(height: 20), // Space between logo and text
              const Text(
                "Deliver Favourite Food",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), // Space between text and input box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF1C0E2B).withOpacity(0.9),
                ),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person_2, color: Colors.white),
                        hintText: "User Name",
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.white),
                        hintText: "Enter email or username",
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.white), // Set text color to white
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        hintText: "Enter Password",
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF6A1B9A),
                      ),
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            20), // Space before the "Already have an account?"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            // Navigate to login page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                   Homescreen(), // Change to Loginscreen
                              ),
                            );
                          },
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google.png",
                              width: 40, height: 40),
                          const SizedBox(width: 12),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/7cce18497a47d39a920a34aea06766ac.png",
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Continue with Facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
