import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewMOdel>(context);

    return  Scaffold(
      appBar: AppBar(title: Text(' Home '),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))
      ],
      ),
      body: Column(
        children: [
          SafeArea(
            child: InkWell(
              onTap: (){
                userPreference.remove().then((value){
                  Navigator.pushNamed(context, RoutesNames.login);
                });
              },
              child: Text('Log Out')),
          ),
        ],
      ),
    );
  }
}