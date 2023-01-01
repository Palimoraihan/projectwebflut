import 'package:flutter/material.dart';
import 'package:palimo_portfolio_web/conection_error.dart';
import '../model/my_model.dart';
import '../services/api_services.dart';

enum ResultState { Loading, NoData, HasData, error }

class MyProvider extends ChangeNotifier {
  final ApiService apiService;
  MyProvider({required this.apiService}) {
    _fetchAllData();
  }

  late MyModel _dataResult;
  late ResultState _state;
  String _massage = '';
  MyModel get result => _dataResult;
  ResultState get state => _state;
  String get massage => _massage;

  List<ItemProject> search = [];

  Future<dynamic> _fetchAllData() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final dataProject = await apiService.myServer();
      if (dataProject.projects.isEmpty &&
          dataProject.mydesc.isEmpty &&
          dataProject.skillDesain.isEmpty &&
          dataProject.skillDev.isEmpty &&
          dataProject.skillDb.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _massage = 'Empty data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _dataResult = dataProject;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }

  Future<dynamic> searchData(String text) async {
    try {
      final dataProject = await apiService.myServer();
      search.clear();
      if (text.isEmpty) {
        notifyListeners();
        return;
      }
      for (var item in dataProject.projects) {
        final judul = item.judul!.toLowerCase();
        final category = item.category!.toLowerCase();
        if (judul.contains(text.toLowerCase()) ||
            category.contains(text.toLowerCase())) search.add(item);
        notifyListeners();
      }
    } catch (e) {
      ConnectionError();
      notifyListeners();
    }

    // for (var item in _dataResult.projects) {
    //   if (item.judul!.contains(text) || item.category!.contains(text)) {
    //      search.add(item);
    //      notifyListeners();
    //   }
    // }
    // notifyListeners();
  }
}
