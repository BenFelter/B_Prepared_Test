import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/theme/color_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height / 100),
                      height: height / 20,
                      width: width / 12,
                      child: SvgPicture.asset(
                        'assets/Logo-B-Dark.svg',
                        fit: BoxFit.contain,
                      ),
                      // color: Colors.black
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Prepared',
                          style: TextStyle(
                            color: CustomColors.scoutingBlue,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        )),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 15),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: (width * .625)),
                  child: TextButton(
                    onPressed: () {
                      // BlocProvider.of<AppCubit>(context).authenticate();
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: CustomColors.selectionBlue),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).authenticate();
                      },
                    )),
                const Divider(
                  thickness: 2,
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      'Not Prepared?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      // color: Colors.blue,
                      child: const Text(
                        'Join Now',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )));
  }
}
