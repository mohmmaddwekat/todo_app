import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/login/cubit.dart';
import 'package:shop_app/modules/login/states.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/form/default_button.dart';
import 'package:shop_app/shared/components/form/default_form_field.dart';
import 'package:shop_app/shared/constants/styles/styles.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.status!) {
              // showToast(text: state.loginModel!.message!, state: ToastState.SUCCESS);
              CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel!.data!.token
              ).then((value) {
                navigateAndFinish(context, ShopLayout());
              }).catchError((error){
                print(error);
              });
            } else {
              // showToast(text: state.loginModel!.message!, state: ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding_20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                            color: darkColor,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                              color: greyColor
                          ),
                        ),
                        SizedBox(
                          height: height_40 - 10,
                        ),
                        DefaultFomField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        DefaultFomField(
                          controller: passwordController,
                          suffix: loginCubit.suffix,
                          suffixPressed: () {
                            loginCubit.changePasswordVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: loginCubit.isPassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is  too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: height_40 - 10,
                        ),
                        conditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: DefaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: Center(child: CircularProgressIndicator()),
                        ),

                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'don\'t have an account?',
                            ),
                            DefaultButton(
                              function: () {
                                navigateTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: 'Register',
                              isText: true,
                              textColors: defaultColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
