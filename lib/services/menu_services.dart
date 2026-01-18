import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/menu_item.dart';


class MenuServices {
  static const String _url = String.fromEnvironment('API_URL');

  Future<List<MenuItem>> fetchMenu() async{
    try{
      final response = await http.get(Uri.parse(_url));
      if(response.statusCode == 200){
        final Map<String, dynamic> JsonResponse = json.decode(response.body);
        final List<dynamic> menuList = JsonResponse['menu'];

        return menuList.map((item) => MenuItem.fromJson(item)).toList();
      } else {
        return[];
      }
    } catch (e){
      return[];
    }
  }
}