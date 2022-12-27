import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  splashServices splashservices = splashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  splashservices.checkAuthentication(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SafeArea(
              child: const Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/png.png'),
                  ),
                ),
            ),

              //  const Center(
              //   child: CircleAvatar(
              //     radius: 20.0,
              //     backgroundImage: AssetImage('images/XYZ.jpg'),
              //   ),
              // ),

            SizedBox(height: 20,),

          Container(
            child: Text('National Institute of Technology , Hamirpur'),
          )

        ],
      ),
    );
  }
}