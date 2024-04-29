import 'package:flutter_getx_material/config.dart';
import 'package:get/get.dart';

class AuthService extends GetConnect {
  Future<String> login(String username, String password) async {
    try {
      final response =
          await post('${ConfigEnvironments.getEnvironments()['url']}/integration/customer/token', {
        'username': username,
        'password': password,
      });
      print(response.bodyString);
      return response.bodyString ?? '';
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
