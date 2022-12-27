import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassward = ValueNotifier<bool>(true);

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwardconroller = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwardFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwardconroller.dispose();

    emailFocusNode.dispose();
    passwardFocusNode.dispose();

    _obsecurePassward.dispose();

  }
  
  @override
  Widget build(BuildContext context) {

    final AuthViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height *1;

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextFormField(
            controller: _emailcontroller,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'email',
              labelText: 'email',
              prefixIcon: Icon(Icons.email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocusChange(context , emailFocusNode , passwardFocusNode);
            }
          ),
          SizedBox(height: 20,),

          ValueListenableBuilder(
            valueListenable: _obsecurePassward,
           builder:  (context, value, child) {
             return  TextFormField(
            controller: _passwardconroller,
            obscureText: _obsecurePassward.value,
            obscuringCharacter: "*",
            focusNode: passwardFocusNode,
            decoration:  InputDecoration(
              hintText: 'passward',
              // labelText: 'passward',
              prefixIcon: Icon(Icons.lock_open_outlined),
              suffixIcon: InkWell(
               onTap: () {
                 _obsecurePassward.value = !_obsecurePassward.value;
               },
                child: Icon(
                  _obsecurePassward.value?
                  Icons.visibility_off_outlined : Icons.visibility),),
            ),
          );
       
           }
           ),

           SizedBox(height: height * .081,),

           RoundButton(
            title: 'Sign Up',
            loading: AuthViewMode.signUpLoading,
            onPress: (){

              if(_emailcontroller.text.isEmpty){

                Utils.flushBarErrorMessage('Please enter email', context);

              }else if(_passwardconroller.text.isEmpty){

                Utils.flushBarErrorMessage('please enter passward', context);

              }else if(_passwardconroller.text.length < 6){

                Utils.flushBarErrorMessage('please enter 6 digit passward', context);

              }else{

                Map data = {
                  'email' : _emailcontroller.text.toString(),
                  'password' : _passwardconroller.text.toString(),

                };
                AuthViewMode.signUpApi(data , context);
                print('api hit');
              }

            },
           ),
          
          SizedBox(height: height * .021,),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesNames.login);
            },
            child: Text('Already have a account? Login Up ')),

          ],),
      ) );
  }
}