import 'package:flutter/material.dart';
import 'package:real_estate/shared/custom_btn.dart';
import 'package:real_estate/shared/custom_text.dart';
import 'package:real_estate/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emaiController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffb6b3b3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ الجزء اللي فيه الصورة والفورم
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/test/house3.png",
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.9),
                    ),
                    Container(color: Colors.black.withOpacity(0.3)),
                    SafeArea(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "احجز وحدتك السكنيه الان",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "يمكنك الوصول إلى أفضل القوائم في أي وقت وفي أي مكان.",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            const SizedBox(height: 180),
                            CustomTextField(
                              controller: emaiController,
                              hintText: 'UserName',
                              icon: Icons.person,
                              isEmail: true,
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller: confirmpasswordController,
                              hintText: 'Confirm Password',
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 50),
                            CustomBtn(
                              text: "Sign-In",
                              width: double.infinity,
                              size: 15,
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ الجزء اللي تحت الصورة (خارج الكونتينر)
              Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Have a Account Before? ",
                    color: Colors.white,
                    weight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                    ,
                    child: CustomText(
                      text: " Sign-In",
                      color: Colors.brown,
                      weight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
