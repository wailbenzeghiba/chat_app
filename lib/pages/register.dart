import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/MyButton.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _ConfirmPwController = TextEditingController();

  final void Function()? ontap;
  Register({super.key, required this.ontap});

  // ignore: non_constant_identifier_names
  void RegisterFun(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();
    if (_passwordController.text == _ConfirmPwController.text ) {
      try {
       await _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
        }
      }
    } else 
    {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(title: Text("Passwords Dont Match")),
        );
    }
  }

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              'Lets Create An Account For You!',
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
            const SizedBox(height: 10),
            Mytextfield(
              hintTextt: 'confirm Password',
              obsecureText: true,
              controller: widget._ConfirmPwController,
            ),
            const SizedBox(height: 25),
            Mybutton(text: 'Sign up', ontap: () => widget.RegisterFun(context)),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have An Account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    'Sign In Here!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
