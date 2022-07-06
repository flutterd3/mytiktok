import 'package:flutter/material.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/widgets/text_input_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _usernamenameController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      // appBar: AppBar(),
// ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              "Aavash Tiktok",
              style: TextStyle(
                fontSize: 35,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Text(
            "Login",
            style: TextStyle(
              fontSize: 35,
              color: buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1657028814638-bf738a9d40c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                ),
                backgroundColor: Colors.black,
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {
                      print("clicked");
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputFeild(
                controller: _usernamenameController,
                labelText: 'Username',
                icon: Icons.person_add_alt_1_outlined),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputFeild(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputFeild(
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.password,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // login
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap: () {},
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\t have an account',
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
