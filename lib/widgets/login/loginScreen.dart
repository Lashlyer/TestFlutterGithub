import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: LeezenCustomUI.backgroundImage),
        Positioned.fill(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Image.asset(
                  'assets/img-invalidName@3x.png',
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/img-illuLogin@3x.png',
                  height: 600,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: SizedBox(
                    height: 48,
                    child: _buildTextField(phoneController, '請輸入手機號碼')),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: SizedBox(
                    height: 48,
                    child: _buildTextField(passwordController, '密碼')),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: LeezenColor.primary001.getTypeColor(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 40, vertical: 15)),
                    child: const Text(
                      '登入',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _buildTextField(TextEditingController? controller, String hint) {
    return TextField(

      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
          hintText: hint,
          hintStyle: TextStyle(
            color: LeezenColor.greyTextSubTitle.getTypeColor(),
            fontSize: 14,
          ),
          helperStyle: const TextStyle(color: Colors.black, fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1))),
    );
  }
}
