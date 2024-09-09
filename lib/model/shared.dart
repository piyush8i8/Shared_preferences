
import 'package:shared_preferences/shared_preferences.dart';

class shared
{
  static SharedPreferences? obj;

   static void init() async
  {
    obj= await SharedPreferences.getInstance();

}
static void setFirstTime(bool status) async
{
  await obj!.setBool("firsttime", status);
}

static bool? getFirstTime()
{
  return obj!.getBool("firsttime");
}
static void setLogin(bool status ) async
{
  await  obj!.setBool("Login", status);
}
  static bool? getLogin()
  {
    return obj!.getBool("Login");
  }
  static void setUserName(String userName)async
  {
    await obj!.setString("userName", userName);
  }
  static String? getUserName()
  {
    return obj!.getString("userName");

  }
  static void setUserEmail(String userEmail)async
  {
    await obj!.setString("userEmail", userEmail);
  }
  static String? getUserEmail()
  {
    return obj!.getString("userEmail");
  }

  static void setUserPass(String userPass)async
  {
    await obj!.setString("userPass", userPass);
  }
  static String? getUserPass()
  {
    return obj!.getString("userPass");
  }

  static void setUserPhone(String userPhone)async
  {
    await obj!.setString("userPhone", userPhone);
  }
  static String? getUserPhone()
  {
    return obj!.getString("userPhone");
  }

}