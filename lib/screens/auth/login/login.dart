import 'package:flutter/material.dart';
import 'package:my_app/screens/auth/login/login.validator.dart';
import 'package:my_app/store/index.dart';
import 'package:my_app/ui/BaseGradientButton/BaseGradientButton.dart';
import 'package:my_app/ui/BaseOutlineButton/BaseOutlineButton.dart';
import 'package:my_app/ui/BaseTextFiled/BaseTextField.dart';
import 'package:provider/provider.dart';

import '../../../apis/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool isHidePass = true;
  bool loading = false;
  final formKey = GlobalKey<FormState>();

  void onSetShowPass() {
    setState(() {
      isHidePass = !isHidePass;
    });
  }

  void setLoading(status) {
    setState(() {
      loading = status;
    });
  }

  void onChangeUsername(value) {}

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    Future onSubmitLogin() async {
      if (formKey.currentState!.validate()) {
        setLoading(true);

        final username = usernameController.text;
        final password = passwordController.text;

        final response = await login(username, password);

        if (response.success == true) {
          appState.setIsLogin(true);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response.data['message'])));
        }

        setLoading(false);
      }
    }

    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
              key: formKey,
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg-auth.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logos/logo.png",
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          "assets/images/logos/logo-type.png",
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Text("LOGIN",
                        //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 40,
                        ),
                        BaseTextField(
                            controller: usernameController,
                            validator: usernameValidator,
                            hint: 'Username',
                            prefixIcon: Icon(
                              Icons.person_2,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        BaseTextField(
                            controller: passwordController,
                            validator: passwordValidator,
                            hint: 'Password',
                            obscureText: isHidePass,
                            suffixIcon: InkWell(
                              onTap: onSetShowPass,
                              child: Icon(
                                isHidePass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BaseGradientButton(
                          onPressed: onSubmitLogin,
                          text: 'Login',
                          disabled: loading,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('--- or ---'),
                        SizedBox(
                          height: 20,
                        ),
                        BaseOutlineButton(
                          onPressed: () {},
                          text: 'Register',
                        )
                      ],
                    ),
                  ),
                ))),
              ))),
    );
  }
}
