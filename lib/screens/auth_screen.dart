import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_cubit.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/auth_switch_widget.dart';
import '../widgets/form/login_form_widget.dart';
import '../widgets/form/register_form_widget.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      height: size.height * 0.25,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/app_icon.png',
                              width: 75,
                              height: 75,
                            ),
                            Text(
                              'Safe',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AuthSwitch(
                      onToggle: (value) {
                        setState(() {
                          isLogin = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    isLogin
                        ? LoginFormWidget()
                        : RegisterFormWidget(),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Or continue whith',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/google.png', width: 25, height: 25),
                            label: Text('Google'),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.45,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/facebook.png', width: 35, height: 35),
                            label: Text('Facebook'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


void myAuthListener(BuildContext context, AuthState state) {
  if (state is AuthSuccess) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } else if (state is AuthError) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message)));
  }
}
