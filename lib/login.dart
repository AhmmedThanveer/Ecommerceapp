import 'package:flutter/material.dart';

import 'package:seedisland/FireBase.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController Usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailidcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 243, 250),
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://wallpaperaccess.com/full/1540723.jpg'),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to ',
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Text('Seed Island,',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Signup to Continue',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Center(
                              child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 255, 255, 250),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: (() {}),
                                      child: const Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                137, 200, 197, 197)),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: (() {}),
                                      child: const Text('SIGNUP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 20, 20, 177))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 270,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('User Name'),
                                      prefixIcon: const Icon(
                                        Icons.person_add_alt,
                                        color:
                                            Color.fromARGB(255, 203, 201, 201),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(88)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 270,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('Email'),
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                        color:
                                            Color.fromARGB(255, 203, 201, 201),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(88)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 270,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('Password'),
                                      prefixIcon: const Icon(
                                        Icons.lock_outline_sharp,
                                        color:
                                            Color.fromARGB(255, 203, 201, 201),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(88)),
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'By pressing  submit you agree to  ',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 163, 162, 162)),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'term & conditions',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 218, 113)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 485),
                          child: Center(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.cyan,
                                )),
                            child: const CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 40,
                              backgroundImage: AssetImage('asset/logo.jpeg'),
                            ),
                          )),
                        )
                      ],
                    ),
                    //     Container(height: 211,width: 222,color: Colors.amber,)
                  ],
                ),
                SizedBox(
                  height: screenWidth > 600 ? 30 : 60,
                ),
                SignInButton(
                    buttonSize: ButtonSize.large,
                    buttonType: ButtonType.google,
                    onPressed: () {
                      firebasegoogleauth().signInWithGoogle();
                      print('click');
                    }),
                SizedBox(
                  height: 20,
                ),
                SignInButton(
                    buttonSize: ButtonSize.large,
                    buttonType: ButtonType.facebook,
                    onPressed: () {
                      print('click');
                    })
              ],
            ),
          ),
        ));
  }
}
