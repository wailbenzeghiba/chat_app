// ignore_for_file: non_constant_identifier_names
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/components/userTile.dart';
import 'package:chat_app/components/myDrawer.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
   Homepage({super.key});
  
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  
  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(child: const Text("H O M E"))),
       

    ),
    drawer: const Mydrawer(),
    body: _BuildUserList(),
    );
  }

  //Build a List of Users Except for current logged in User
    Widget _BuildUserList() 
    
    {
      return StreamBuilder(stream: widget._chatService.getUserStream(), builder: (context , snapshot) 
      {
       //error 
       if (snapshot.hasError) 
       {
        return const Text("An Error Occured!");
       }
       //loading 
       if (snapshot.connectionState == ConnectionState.waiting) 
       {
        return const Text("Loading..");
       }

       // Return User List
       return ListView(children: snapshot.data!.map<Widget>((userData) => _BuildUserListItem(userData,context)).toList(),); 
      });
      
    }
    //build individual UserListItems
    Widget _BuildUserListItem(Map<String,dynamic> userData , BuildContext context ,)  
    {
      if (userData["email"] != widget._authService.getCurrentUSer()!.email) {
      
    return Usertile(
      text: userData["email"],
      onTap: () 
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Chatpage(RecieverEmail: userData["email"],recieverID: userData["uid"],),));
      },
    );
    } else 
    {
      return Container(); 
    }
    }
}