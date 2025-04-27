import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class ChatService 
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // getting user stream
  Stream<List<Map<String,dynamic>>>  getUserStream() 
  {
   return _firestore.collection("Users").snapshots().map((snapshot) {return snapshot.docs.map((doc) 
   {
     // go through all users 
     final user = doc.data();
     return user;
   }
   ).toList();} );
  }
  // send messages 
  Future<void> sendMessage(String recieverID, message) async 
  {
   //get current user info
   final String currentUserID = _auth.currentUser!.uid;
   final String currentUserEmail = _auth.currentUser!.email!;
   final Timestamp timestamp = Timestamp.now();

   //create a new message 
   Message newMessage = Message(senderID: currentUserID, senderEmail: currentUserEmail , recieverID: recieverID, message: message, timestamp: timestamp);

   //construct a chatroom ID for the two Users(sorted to insure uniqueness)
  List<String> ids = {currentUserID, recieverID}.toList();
  ids.sort(); // sort the ids 
  String chatroomID = ids.join('_');
   //add new message to the database
   await _firestore.collection("chat_rooms").doc(chatroomID).collection("messages").add(newMessage.toMap());

  //get Messages
   
  }
  Stream<QuerySnapshot> getMessages(String userID, String otherUseriD) {
  // Construct a chatroom ID for the two users
  List<String> id = [userID, otherUseriD];
  id.sort(); // Sort the IDs
  String chatroomID = id.join('_'); // Join the sorted IDs to create a unique chatroom ID

  // Return the stream of messages
  return _firestore
      .collection("chat_rooms")
      .doc(chatroomID)
      .collection("messages")
      .orderBy("timestamp", descending: false)
      .snapshots();
}
   
}