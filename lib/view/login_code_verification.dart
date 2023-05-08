import 'package:flutter/material.dart';

import 'Home_page.dart';

class LoginCodeVerification extends StatefulWidget {
  const LoginCodeVerification({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  State<LoginCodeVerification> createState() => _LoginCodeVerificationState();
}

class _LoginCodeVerificationState extends State<LoginCodeVerification> {
  final TextEditingController _otpController = TextEditingController();
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
                      "Enter code sent\nto your phone",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We sent it to number  ${widget.phoneNumber} ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _otpController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 30),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '_ _ _ _ _ _',
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
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Text(
                        "ENTER",
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
                          ),
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
