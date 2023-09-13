import 'package:firebase_database/firebase_database.dart';
import 'package:sohoj_trip_app/data/model/use_model.dart';
import 'package:sohoj_trip_app/global/global.dart';

class AssistantMethods {
  static void readCurrentOnlineUserInfor() async {
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    // userRef.once().then((snap) {
    //   if (snap.snapshot.value != null) {
    //     userModelCurrentInfo =
    //         UserModel.fromSnapShot(snap.snapshot) as userModel?;
    //   }
    // });
  }
}
