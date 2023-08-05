import 'package:flutter/material.dart';
import 'package:flutter_pk/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = 'Tiger';
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
              Text(
                'Welcome to Jungle, $name !',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                child: TextFormField(
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 35),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isChanged = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                child: AnimatedContainer(
                  curve: Curves.linearToEaseOut,
                  alignment: Alignment.center,
                  height: 50,
                  width: isChanged ? 50 : 160,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  duration: const Duration(
                    seconds: 2,
                  ),
                  child: (isChanged)
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     fixedSize: const Size(160, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //   ),
              //   child: const Text(
              //     'Login',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 17,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
