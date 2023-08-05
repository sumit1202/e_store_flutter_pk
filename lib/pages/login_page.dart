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
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
      isChanged = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      isChanged = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username can\'t be empty';
                      } else {
                        return null;
                      }
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password can\'t be empty';
                      } else if (value.length < 6) {
                        return 'password length can\'t be less than 6';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.teal,
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      curve: Curves.linearToEaseOut,
                      alignment: Alignment.center,
                      height: 50,
                      width: isChanged ? 50 : 160,
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
      ),
    );
  }
}
