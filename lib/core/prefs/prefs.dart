import 'package:http/http.dart';
import 'package:wagyufari/core/prefs/prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wagyufari/injection_container.dart';

class Prefs{
  static Future<String?>? setLanguage({String? language}) async {
    SharedPreferences prefs = sl();
    if(language != null){
      await prefs.setString(PrefsConstants.language,language);
    } else{
      return prefs.getString(PrefsConstants.language);
    }
    return "id";
  }
  static String getLanguage(){
      SharedPreferences prefs = sl();
      return prefs.getString(PrefsConstants.language) ?? "id";
  }

  static Future<String?>? accessToken({String? token}) async {
    SharedPreferences prefs = sl();
    if(token != null){
      await prefs.setString(PrefsConstants.accessToken,token);
    } else{
      return prefs.getString(PrefsConstants.accessToken);
    }
    return null;
  }
  static Future<String?>? teamName({String? teamName}) async {
    SharedPreferences prefs = sl();
    if(teamName != null){
      await prefs.setString(PrefsConstants.teamDomainName,teamName);
    } else{
      return prefs.getString(PrefsConstants.teamDomainName);
    }
    return null;
  }
  static Future<bool?>? isTwoFactorAuth({bool? twoFactorAuth}) async {
    SharedPreferences prefs = sl();
    if(twoFactorAuth != null){
      await prefs.setBool(PrefsConstants.isTwoFactorAuth,twoFactorAuth);
    } else{
      return prefs.getBool(PrefsConstants.isTwoFactorAuth);
    }
  }
  static Future<bool?>? isResetPasswordAllowed({bool? resetPasswordAllowed}) async {
    SharedPreferences prefs = sl();
    if(resetPasswordAllowed != null){
      await prefs.setBool(PrefsConstants.isResetPasswordAllowed,resetPasswordAllowed);
    } else{
      return prefs.getBool(PrefsConstants.isResetPasswordAllowed);
    }
  }
}