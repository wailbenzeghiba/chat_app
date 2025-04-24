import 'package:chat_app/components/myTextField.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Icon(Icons.message , size: 60, color: Theme.of(context).colorScheme.primary,),  
        
            const SizedBox(height: 50,), 
        
            Text('Welcome back!!', style: TextStyle(color: Theme.of(context).colorScheme.primary , fontSize: 16),),
        
            const SizedBox(height: 25,), 

            Mytextfield(hintTextt: 'email', obsecureText: false,controller: widget._emailController,),
            const SizedBox(height: 10,),  
             Mytextfield(hintTextt: 'password',obsecureText: true,controller: widget._passwordController,),
              
        
        
        
            
        ]),
      ),
    );
  }
}
