import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/cubits/auth_cubit.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            //logout user
            final authCubith = context.read<AuthCubith>();
            authCubith.logout();

          }, icon: Icon(Icons.power_settings_new))
        ],
      ),
    );
  }
}
