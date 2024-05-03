import 'package:animate_do/animate_do.dart';
import 'package:erevive/login/loginpage.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Create an account, It's free",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: makeInput(
                        label: "Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is mandatory';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: makeInput(
                        label: "Phone Number",
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is mandatory';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: makeInput(
                        label: "Username",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is mandatory';
                          }
                          return null;
                        },
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: makeInput(
                        label: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is mandatory';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Container(
                    padding: const EdgeInsets.only(top: 1, left: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, proceed with signup action
                          // Implement your signup logic here
                        }
                      },
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          // Navigate to another page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      {label,
      obscureText = false,
      required FormFieldValidator<String> validator,
      TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: keyboardType, // Set keyboardType here
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
          validator: validator,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
