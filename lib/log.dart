
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testss/login/login_cubit.dart';
import 'package:testss/login/login_state.dart';
import 'package:testss/widget/custom_button.dart';

import 'widget/custom.dart';

class login extends StatelessWidget {
var fromKey =GlobalKey<FormState>();

  // const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passWordController = TextEditingController();
    return BlocProvider
      (
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginSuccess){
          if(state.loginstudent.isAuthenticated != null){
            print(state.loginstudent.token);
          }
        }
      },
        builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Log in",style:Theme.of(context).textTheme.headline5 ,),
                  Text("Log in now",style:Theme.of(context).textTheme.bodyText1?.
                  copyWith(color: Colors.grey),),
                  SizedBox(height: 30,),
                  CustomTextField(
                    hint: 'Email Address',
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      emailController.text = value;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextField(
                    hint: 'password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    controller: passWordController,
                    onSubmitted: (value) {
                      if (fromKey.currentState!.validate()){
                        LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passWordController.text);

                      }

                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  state is LoginLoaded
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      :
                  CustomButton(text: "Log in",
                      color: Colors.blue,
                      textcolor: Colors.white,
                      circular: 10.0,
                    onTap: (){
                    if (fromKey.currentState!.validate()){
                      LoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passWordController.text);

                    }
                  },),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
              
                    ],
                  )
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
