import 'package:flutter/material.dart';

import 'login_code_verification.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey)],
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Enter your\nmobile number",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We will send you confirmation code ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _mobileController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 30),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixText: '+91',
                      ),
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF5DDBE3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginCodeVerification(
                              phoneNumber:
                                  '+91${_mobileController.text.trim()}',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "NEXT",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By creating account you agree to our",
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: "Terms of Conditions",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: const Color(0xFF5DDBE3),
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          const TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: const Color(0xFF5DDBE3),
                                  decoration: TextDecoration.underline,
                                ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
