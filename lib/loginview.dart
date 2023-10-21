import 'package:flutter/material.dart';
import 'package:meriapp/signupview.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  onLoginPressed(BuildContext context, emailController, passwordController) {
    String email = emailController.text;
    if (email.contains("@") && email.contains(".com")) {
      print("Email: ${emailController.text}");
      print("password: ${passwordController.text}");
    } else {
      print("In Correct Email");
    }
    emailController.text = "";
    passwordController.text = "";
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => signupView()));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                  hintText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("Hello world");
              },
              child: const SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Text(
                    "Forget Password",
                    textAlign: TextAlign.right,
                  )),
            ),
            SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      onLoginPressed(
                          context, emailController, passwordController);
                    },
                    child: const Text("Login"))),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => signupView()));
                },
                child: const Text("Dont have an account, SignUp"))
          ],
        ),
      ),
    );
  }
}
