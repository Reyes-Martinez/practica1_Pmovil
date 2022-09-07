import 'package:flutter/material.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:practica1/widgets/widgest.dart';
import 'package:practica1/providers/login_form_provider.dart';
import 'package:practica1/ui/input_decorations.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(children: [
                const SizedBox(height: 10),
                const Text('Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginFrom()),
              ]),
            ),
            const SizedBox(height: 25),
            const Text(
              'O puede iniciar sesion con:',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.github,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _LoginFrom extends StatelessWidget {
  const _LoginFrom({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
                hintText: 'example@example.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_sharp),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : "El valor ingresado noluce com un correo";
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
              style: const TextStyle(color: Colors.black),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecorations(
                  hintText: '******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null) && (value.length >= 6)
                    ? null
                    : 'La contraseña debe ser de 6 caracteres';
              }),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      await Future.delayed(const Duration(seconds: 2));
                      loginForm.isLoading = false;
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? "Espere" : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ))),
          const Divider(color: Colors.black),
          SwitchListTile.adaptive(
              value: loginForm.recordar,
              activeColor: Colors.deepPurple,
              onChanged: (value) {
                loginForm.recordar = value;
                if (value == true) {
                  Preference.password = loginForm.password;
                  Preference.user = loginForm.email;
                } else {
                  Preference.password = "";
                  Preference.user = "";
                }
              },
              title: const Text(
                'Recordar credenciales',
                style: TextStyle(color: Colors.black, fontSize: 12),
              )),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
