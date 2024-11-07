import 'package:http/http.dart' as http;
import '../utils/http_client.dart';
import '../models/user_model.dart';

class AuthRepository {
  
  AuthRepository._();

  factory AuthRepository()=> _instance;

  static final AuthRepository _instance = AuthRepository._();

  Future<UserModel?> login(String email, String password) async {
    String endPoint = "login";
    Map<String, dynamic> requestData = {'email': email, 'password': password};
    final response = await APIClient().postRequest(endPoint, requestData);
    
    if(response.isSuccess && response.data != null) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception(response.message);
    } 
  }
}
