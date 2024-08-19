import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/screen/signin_screen.dart';
import 'package:login/widget/custom_scaffold.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, this.selectedGender});
  final String? selectedGender;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState(selectedGender);
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignUpKey = GlobalKey<FormState>();

  //Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Sign user in method
  Future<void> signUpUser() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);

      _showDialog(e.code);
    } finally {
      Navigator.pop(context);
    }
    
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            iconPadding: EdgeInsets.all(12),
            backgroundColor: Colors.blueAccent,
            insetPadding: EdgeInsets.all(20),
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  String? selectedGender = 'Male';
  _SignUpScreenState(this.selectedGender);
  @override
  Widget build(BuildContext context) {
    bool licenceBox = true;
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignUpKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hello!',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue),
                      ),
                      const SizedBox(height: 40),
                      //Name textfield
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Username'),
                            hintText: 'Enter Username',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      const SizedBox(height: 20),
                      //Email textfield
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Email'),
                            hintText: 'Enter Email',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      const SizedBox(height: 20),

                      //for gender
                      DropdownMenu(
                        label: const Text('Gender'),
                        hintText: 'Select a gender',
                        width: 361,
                        inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10.0))),
                        dropdownMenuEntries: <DropdownMenuEntry>[
                          DropdownMenuEntry(value: null, label: 'Male'),
                          DropdownMenuEntry(value: null, label: 'Female'),
                          DropdownMenuEntry(value: null, label: 'Custom')
                        ],
                      ),
                      const SizedBox(height: 20),

                      //matric
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Input Matric Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Matric No.'),
                            hintText: 'Enter Matric number',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      const SizedBox(height: 20),

                      //department
                      DropdownMenu(
                        label: const Text('Department'),
                        hintText: 'Select department',
                        width: 361,
                        inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10.0))),
                        dropdownMenuEntries: <DropdownMenuEntry>[
                          DropdownMenuEntry(
                              value: null, label: 'Computer Science'),
                          DropdownMenuEntry(
                              value: null, label: 'Software Engineering'),
                          DropdownMenuEntry(value: null, label: 'Education'),
                          DropdownMenuEntry(value: null, label: 'Physics'),
                          DropdownMenuEntry(
                              value: null, label: 'Micro Bionlogy'),
                          DropdownMenuEntry(value: null, label: 'Law'),
                          DropdownMenuEntry(value: null, label: 'Economics'),
                          DropdownMenuEntry(
                              value: null, label: 'Political Science'),
                          DropdownMenuEntry(
                              value: null, label: 'Business Admin'),
                          DropdownMenuEntry(
                              value: null, label: 'Mass Communication'),
                          DropdownMenuEntry(value: null, label: 'Theology'),
                          DropdownMenuEntry(
                              value: null, label: 'Computer Engineering'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      //Password textfield
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      const SizedBox(height: 40),

                      //confirm pass
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Confirm Password';
                          } else if (value != passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Confirm Password'),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: licenceBox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    licenceBox = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                              const Text(
                                'Accept Terms and Condition',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            child: const Text(
                              'Terms',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      //Button logic
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignUpKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(child: Divider())
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => SignInScreen(),
                                  ));
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
