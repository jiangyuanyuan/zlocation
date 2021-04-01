import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String KEY_USER_INFO = "KEY_USER_INFO";

class UserInfoModel {
  String id;
  String logo;
  int gender;
  String mobile;
  String nickName;
  String password;
  String salt;
  String inviteCode;
  String txPassword;
  String email;
  String realName;
  String cardNo;
  int cardType;
  String cardForntUrl;
  String cardBackUrl;
  String cardHandUrl;
  String internationalCode;
  int userLevel;
  int authStatus;
  int status;
  int lastLoginTime;
  int createTime;
  int userType;
  /// 注册类型 1手机号 2邮箱
  int registerType;

  UserInfoModel(
      {this.id,
      this.logo,
      this.gender,
      this.mobile,
      this.nickName,
      this.password,
      this.salt,
      this.inviteCode,
      this.txPassword,
      this.email,
      this.internationalCode,
      this.realName,
      this.cardNo,
      this.cardType,
      this.cardForntUrl,
      this.cardBackUrl,
      this.cardHandUrl,
      this.userLevel,
      this.authStatus,
      this.status,
      this.lastLoginTime,
      this.createTime,
      this.userType,
      this.registerType});
  
  static void saveData(Map<String, dynamic> val) {
    SharedPreferences.getInstance().then((value) => value.setString(KEY_USER_INFO, json.encode(val)));
  }

  static Future<UserInfoModel> data() async {
    final share = await SharedPreferences.getInstance();
    final str = share.getString(KEY_USER_INFO);
    if(str == null) return null;
    return UserInfoModel.fromJson(json.decode(str));
  }

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    gender = json['gender'];
    mobile = json['mobile'];
    nickName = json['nickName'];
    password = json['password'];
    salt = json['salt'];
    inviteCode = json['inviteCode'];
    txPassword = json['txPassword'];
    email = json['email'];
    realName = json['realName'];
    cardNo = json['cardNo'];
    internationalCode = json["internationalCode"];
    cardType = json['cardType'];
    cardForntUrl = json['cardForntUrl'];
    cardBackUrl = json['cardBackUrl'];
    cardHandUrl = json['cardHandUrl'];
    userLevel = json['userLevel'];
    authStatus = json['authStatus'];
    status = json['status'];
    lastLoginTime = json['lastLoginTime'];
    createTime = json['createTime'];
    userType = json['userType'];
    registerType = json['registerType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['inviteCode'] = this.inviteCode;
    data['txPassword'] = this.txPassword;
    data['email'] = this.email;
    data['realName'] = this.realName;
    data['cardNo'] = this.cardNo;
    data['cardType'] = this.cardType;
    data['cardForntUrl'] = this.cardForntUrl;
    data['cardBackUrl'] = this.cardBackUrl;
    data['cardHandUrl'] = this.cardHandUrl;
    data['userLevel'] = this.userLevel;
    data['authStatus'] = this.authStatus;
    data['status'] = this.status;
    data['lastLoginTime'] = this.lastLoginTime;
    data['createTime'] = this.createTime;
    data['userType'] = this.userType;
    data['registerType'] = this.registerType;
    data['internationalCode'] = this.internationalCode;
    return data;
  }
}
