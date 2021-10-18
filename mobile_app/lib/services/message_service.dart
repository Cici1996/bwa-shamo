import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/models/message_model.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:mobile_app/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<List<MessageModel>> getMessageByUserId({required int userId}) {
    try {
      return firestore
          .collection("messages")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt!.compareTo(b.createdAt ?? DateTime.now()));
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {UserModel? user,
      bool isFromUser = true,
      String? message,
      ProductModel? product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user?.id,
        'userName': user?.name,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UnitialiazeProductModel ? {} : product?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString()
      }).then((value) => log("pesan berhasil dikirim"));
    } catch (e) {
      throw Exception("Pesan gagal dikirim dengan error : ${e.toString()}");
    }
  }
}
