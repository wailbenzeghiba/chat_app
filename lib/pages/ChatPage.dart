// ignore_for_file: file_names, non_constant_identifier_names

import 'package:chat_app/components/myTextField.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  final String RecieverEmail;
  final String recieverID;
  Chatpage({super.key, required this.RecieverEmail, required this.recieverID});
  //text  controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    //if there is something to send
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(recieverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.RecieverEmail)),
    body: Column(children: [
      /* all the messages */
      Expanded(child: _buildMessageList()),
      _buildUserInput(),

      ],),);

  }
  Widget _buildMessageList() 
  {
    String senderID = widget._authService.getCurrentUSer()!.uid;
    return StreamBuilder(stream: widget._chatService.getMessages(widget.recieverID,senderID), builder: (context , snapshot) 
    {
      if (snapshot.hasError) 
      {
        return const Text("Error");
      }
      //loading 
      if (snapshot.connectionState == ConnectionState.waiting) 
      {
        return const Text("Loading..");
      }
      //return ListView
      return ListView(children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),);
    });
   
  }
  Widget _buildMessageItem(DocumentSnapshot doc) 
   {
   Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
   return Text(data["message"]);
   }

   //build message input 

   Widget _buildUserInput() {
  return Row(
    children: [
      Expanded(
        child: Mytextfield(
          hintTextt: 'send message',
          obsecureText: false,
          controller: widget._messageController,
        ),
      ),
      IconButton(
        onPressed: widget.sendMessage, // Fixed here
        icon: const Icon(Icons.send),
      ),
    ],
  );
}
    
}
