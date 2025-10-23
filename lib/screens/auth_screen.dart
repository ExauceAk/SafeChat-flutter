import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_cubit.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/auth_switch_widget.dart';
import '../widgets/text_field_widget.dart';
import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    AuthSwitch(),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildTextField(emailController, "Email"),
                          const SizedBox(height: 10),
                          buildTextField(
                            passwordController,
                            "Password",
                            isPassword: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (v) {},
                                    activeColor: Colors.blueAccent,
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password?"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        Container(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/google.png'),
                            label: Text('Google'),
                          ),
                        ),
                        Container(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset('assets/images/google.png'),
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } else if (state is AuthError) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message)));
  }
}
