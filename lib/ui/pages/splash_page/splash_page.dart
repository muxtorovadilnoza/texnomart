import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/splash_bloc.dart';
import '../language_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SplashBloc()..add(SplashLoadedEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if(state is SplashLoading){
            Navigator.pushReplacementNamed(context,'/language_page');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.yellow[700],
          body: Center(
            child:Text("Texnomart",style: TextStyle(fontSize: 34,color: Colors.black,fontWeight: FontWeight.w600),)
          ),

        ),
      ),
    );
  }
}
