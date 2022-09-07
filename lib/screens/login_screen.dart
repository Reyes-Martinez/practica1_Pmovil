import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtConUse = TextEditingController();
  TextEditingController txtConPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      controller: txtConUse,
      decoration: const InputDecoration(
        hintText: 'Introduce el usuario',
        label: Text('Correo Electrónico'),
      ),
    );

    final txtPwd = TextField(
      obscureText: true,
      controller: txtConPwd,
      decoration: const InputDecoration(
        hintText: 'Introduce el password',
        label: Text('Contraseña'),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20,
                bottom: MediaQuery.of(context).size.width / 20,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  txtUser,
                  const SizedBox(
                    height: 15,
                  ),
                  txtPwd,
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                'assets/sol.png',
                width: MediaQuery.of(context).size.width / 2.3,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 2,
              right: MediaQuery.of(context).size.width / 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/dashboard', arguments: {});
                },
                child: Image.asset('assets/bloque.png',
                    height: MediaQuery.of(context).size.width / 5),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 80,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.github,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
