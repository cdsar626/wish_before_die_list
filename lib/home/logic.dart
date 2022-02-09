import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:death_wish_list/models/User.dart';

enum HomeStates {logout, login}

class HomeLogic extends GetxController {
  late User _user;
  var status = HomeStates.logout.obs;
  var db;
  var collUsers;
  var collWishes;
  var listOfWishes;
  var lOWleng = 0.obs;

  void toLogout() => status.value = HomeStates.logout;
  void toLogin() => status.value = HomeStates.login;

  void setEmail(val) => this._user.setEmail(val);
  void setUsername(val) => this._user.setUsername(val);

  User getUser() => this._user;

  Future<void> loadUserData(username) async {
    var userdata = await collUsers.findOne(mongo.where.eq('username', username));
    this._user = User.fromObject(userdata);
  }

  Future<void> initDBConnection() async {
    db = await mongo.Db.create("mongodb+srv://userDWL:P4ss4DWL@cd-ingress.epbnz.gcp.mongodb.net/DeathWishList?retryWrites=true&w=majority");
    await db.open();
    collUsers = await db.collection('Users');
    collWishes = await db.collection('Wishes');
  }

  Future<void> registerUser(user) async {
    await collUsers.insertOne({
      'username': user,
      'isFirstLogin': true,
      'firstLogin': DateTime.now().toUtc(),
    });
  }

  Future<bool> userExist(user) async {
    return await collUsers.findOne(mongo.where.eq('username', user)) == null ? false : true;
  }

  Future<void> insertWish(wish) async {
    await collWishes.insertOne({'username': _user.getUsername(), 'wish': wish, 'status': 'Just a dream'});
    await getWishesFromUser(_user.getUsername());
  }

Future<void> getWishesFromUser(user) async {
  this._user.setWishes(await collWishes.find({'username': _user.getUsername()}).toList());
  lOWleng.value = this._user.getWishes()?.length ?? 0;
  }

  Future<void> deleteWish(wishId) async {
    await collWishes.deleteOne({'_id': wishId});
    await getWishesFromUser(this._user.getUsername());
  }
}
