import 'package:flutter/material.dart';
import 'package:uas/models/users.dart';


class userListManager with ChangeNotifier {
  
  bool isLogin = false;
  List<userModels> listUsers = [
    userModels(username: "a", email: "a", passwd: "a"),
    userModels(username: "testing", email: "test@gmail.com", passwd: "12345678"),
  ];
  
  late userModels currentUser;

  void addUser(username, email, passwd){
    listUsers.add(userModels(username: username, email: email, passwd: passwd));
    print(listUsers);
  }

  bool checkUser(String username, String passwd){
    notifyListeners();
    List<userModels> userList = listUsers;
    for (var element in userList) {
      if(element.email == username && element.passwd == passwd){
        return true;
      }
    }
    return false;
  }

  bool availableUser(String email){
    notifyListeners();
    List<userModels> userList = listUsers;
    for (var element in userList) {
      if(element.email == email){
        return false;
      }
    }
    return true;
  }

    void changePFP(value) {
    currentUser.pfp = value;
    notifyListeners();
  }

  void changeUser(value){
    currentUser = value;
    isLogin = true;
  }
}
