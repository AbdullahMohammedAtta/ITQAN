import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itqan/Cubits/RegisterCubit/register_cubit.dart';
import 'package:itqan/Cubits/RegisterCubit/register_states.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Functions/functions.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child:BlocConsumer<RegisterCubit, RegisterStates>
          (
          listener: (context, state) {
            if (state is RegisterErrorState)
            {
              showToast(text: 'error,Try again!', state: ToastState.WRONG);
            }
            if (state is RegisterSuccessState)
            {
              showToast(
                  text: 'Register successfully', state: ToastState.SUCCESS);
              CacheHelper.saveData(key: 'token', value: RegisterCubit.get(context).token);
              navigateAndFinish(context, const HomePage());
            }
          },
          builder:(context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0.2,
                centerTitle: true,
                title:  const Text(
                  'Register',
                ),
              ),
              body: Padding(
                padding:  const EdgeInsets.only(
                  right: 5.0,
                  left: 5.0,
                  bottom: 50,
                  top: 10,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Card(
                      elevation: 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  const Image(
                                image:AssetImage('Assets/images/pngegg.png') ,
                              )
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
                                    return 'Write your name';
                                  }
                                  return null;
                                },
                                clipBehavior: Clip.hardEdge,
                                controller: nameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration:   const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(Icons.person_2_outlined,color: Colors.grey,),
                                    hintText: 'name',
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                    )
                                ),
                                style:  const TextStyle(
                                  fontSize: 20,
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
                                    return 'Write your email';
                                  }
                                  return null;
                                },
                                clipBehavior: Clip.hardEdge,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration:   const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                    )
                                ),
                                style:  const TextStyle(
                                  fontSize: 20,
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
                                obscureText: cubit.isPassword ? false : true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration:   InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    prefixIcon:  const Icon(Icons.lock_outline,color: Colors.grey,),
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        cubit.changeIconSuffixPassword();
                                      },
                                      icon: cubit.isPassword ? const Icon(Icons.visibility_off_outlined,color: Colors.grey,) : const Icon(Icons.visibility_outlined,color: Colors.grey,),
                                    ),
                                    hintText: 'password',
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                    )
                                ),
                                style:  const TextStyle(
                                  fontSize: 20,
                                ),

                              ),
                            ),
                          ),
                          const SizedBox(height:30,),
                          Row(
                            children: [
                              const Expanded(child: SizedBox(height:20,)),
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  onPressed: (){
                                    if(formKey.currentState!.validate())
                                    {
                                      //cubit.userRegister(email: emailController.text, password: passwordController.text, name: nameController.text,);
                                    }

                                  },
                                  color: defaultColor,
                                  elevation: 5,
                                  animationDuration: const Duration(milliseconds: 3000),
                                  highlightColor: Colors.black54,
                                  highlightElevation: 15,
                                  minWidth: double.infinity,
                                  splashColor: Colors.green,
                                  child: ConditionalBuilder(
                                    condition: state is! RegisterLoadingState,
                                    builder: (context) => const Text(
                                      "Register",
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
                          const SizedBox(height:30,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
