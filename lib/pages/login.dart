import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/MyButton.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? ontap;
  login({super.key, required this.ontap});

  void loginfun(BuildContext context) async {
    final authService = AuthService();
    try 
    {
      await authService.signInWithEmailAndPassword(_emailController.text,_passwordController.text);
    } catch (e) 
    {
      if (context.mounted)
      {
      showDialog( context: context, builder:  (context) => AlertDialog(title: Text(e.toString()
      ),) );
      }
    }


  }

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
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 50),

            Text(
              'Welcome back!!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 25),

            Mytextfield(
              hintTextt: 'Email',
              obsecureText: false,
              controller: widget._emailController,
            ),
            const SizedBox(height: 10),
            Mytextfield(
              hintTextt: 'Password',
              obsecureText: true,
              controller: widget._passwordController,
            ),
            const SizedBox(height: 25),
            Mybutton(text: 'Login', ontap: () => widget.loginfun(context),),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('Not Registered Yet? ', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary , fontSize: 15),),
                GestureDetector(
                  onTap: widget.ontap,
                  
                  child: Text('Create An Account!', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
