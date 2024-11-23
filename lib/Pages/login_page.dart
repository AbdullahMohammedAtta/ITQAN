import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/LoginCubit/login_cubit.dart';
import 'package:itqan/Cubits/LoginCubit/login_states.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/Pages/register_page.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>
        (
        listener: (context, state)
        {
          if(state is LoginErrorState)
          {
            showToast(text: 'Error!,Try again', state: ToastState.WRONG);
          }
          if(state is  LoginSuccessState)
          {
            showToast(text: 'logged in successfully' ,state: ToastState.SUCCESS);
            //navigateAndFinish(context, HomePage());
            CacheHelper.saveData(
              key: 'token',
              value: LoginCubit.get(context).token,
            ).then((value)
            {
              navigateAndFinish(context, const HomePage());
            }
            );
          }
        },
        builder:(context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.2,
              title: const Text(
                'Login',
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                     Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*0.35,
                          child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('Assets/Images/LOGO.jpg'),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.black.withOpacity(0.4),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: const Padding(
                        //       padding: EdgeInsets.all(8.0),
                        //       child: Text('Login and choose your best partner! 👌',style: TextStyle(color: Colors.white,fontSize: 13),),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.only(
                                  top: 0,
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if(value!.isEmpty)
                                    {
                                      return 'Write your email';
                                    }
                                    return null;
                                  },
                                  clipBehavior: Clip.hardEdge,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:   InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      prefixIcon: const Icon(Icons.email_outlined,color: Colors.grey,),
                                      hintText: 'Write your email',
                                      label: Text(
                                        'Email',
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey
                                      )
                                  ),
                                  style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height:30,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.only(
                                  top: 0,
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if(value!.isEmpty)
                                    {
                                      return 'Write your password';
                                    }
                                    return null;
                                  },
                                  clipBehavior: Clip.hardEdge,
                                  controller: passwordController,
                                  obscureText: cubit.isPasswordIconChanged ? false : true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration:   InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      prefixIcon:  const Icon(Icons.lock_outline,color: Colors.grey,),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          cubit.changePasswordIcon();
                                        },
                                        icon: cubit.isPasswordIconChanged ? const Icon(Icons.visibility_off_outlined,color: Colors.grey,) : const Icon(Icons.visibility_outlined,color: Colors.grey,),
                                      ),
                                      label: Text(
                                        'password',
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      hintText: 'Write your password',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 16,
                                      )
                                  ),
                                  style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),

                                ),
                              ),
                            ),
                            const SizedBox(height:20,),
                            Row(
                              children: [
                                const Expanded(child: SizedBox(height:20,)),
                                Expanded(
                                  flex: 1,
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if(formKey.currentState!.validate())
                                      {
                                        // cubit.userLogin(email: emailController.text,
                                        //     password: passwordController.text);
                                      }
                                    },
                                    color: defaultColor,
                                    elevation: 5,
                                    animationDuration: const Duration(milliseconds: 3000),
                                    highlightColor: Colors.black54,
                                    highlightElevation: 15,
                                    minWidth: double.infinity,
                                    child: ConditionalBuilder(
                                      condition: state is! LoginLoadingState,
                                      builder: (context) => const Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      fallback: (context) => const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(child: SizedBox(height:20,)),
                              ],
                            ),
                            const SizedBox(height:10,),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()));
                              },
                              child:   Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: defaultColor,
                                ),
                              ),
                            ),
                            const SizedBox(height:30,),
                          ],
                        ),
                      ),
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
