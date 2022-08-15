import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/auth_store.dart';

class SplashScreenPage extends StatelessWidget {

  final authStore = Modular.get<AuthStore>();

  SplashScreenPage({Key? key}) : super(key: key) {
    authStore.checkLogin().then((logged) {
      if(logged){
        Modular.to.navigate('/notes/');
      } else { 
        Modular.to.navigate('/login/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}