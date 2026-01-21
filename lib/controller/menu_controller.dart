import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../services/menu_services.dart';

enum MenuStatus { loading, success, error, empty }

class MenuController extends ChangeNotifier {
  final _menuServices = MenuServices();
  var status = MenuStatus.loading;
  List<MenuItem> listMenu = [];
  List<MenuItem> _listOriginalMenu = [];
  String errorMessage = '';

  Future<void> fetchMenuData() async {
    status = MenuStatus.loading;
    notifyListeners();

    try {
      final results = await _menuServices.fetchMenu();

      if (results.isEmpty) {
        status = MenuStatus.empty;
      } else {
        listMenu = results;
        _listOriginalMenu = results;
        status = MenuStatus.success;
      }
    } catch (e) {
      status = MenuStatus.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void filterByCategory(String category) {
    if (category.toLowerCase() == 'all') {
      listMenu = _listOriginalMenu;
    } else {
      listMenu = _listOriginalMenu.where((item) {
        return item.category.toLowerCase() == category.toLowerCase();
      }).toList();
    } if(listMenu.isEmpty){
      status = MenuStatus.empty;
    } else{
      status = MenuStatus.success;
    }
    notifyListeners();
  }

  void searchInput(String query) {
    if (query.isEmpty) {
      listMenu = _listOriginalMenu;
      status = MenuStatus.success;
    } else {
      listMenu = _listOriginalMenu.where((item) {
        final menutitle = item.title.toLowerCase();
        final searchInput = query.toLowerCase();
        return menutitle.contains(searchInput);
      }).toList();
    }
    if (listMenu.isEmpty) {
      status = MenuStatus.empty;
    } else {
      status = MenuStatus.success;
    }
    notifyListeners();
  }
}
