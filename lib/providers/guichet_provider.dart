import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/guichet.dart';
import '../data/guichet_data.dart';

class GuichetProvider with ChangeNotifier {
  List<Guichet> _guichets = [];

  List<Guichet> get guichets => _guichets;

  void loadGuichets() {
    final List<dynamic> jsonData = jsonDecode(sampleGuichetData);
    _guichets = jsonData.map((item) => Guichet.fromJson(item)).toList();
    notifyListeners();
  }

  void addGuichet(Guichet guichet) {
    _guichets.add(guichet);
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _guichets[index].isFavorite = !_guichets[index].isFavorite;
    notifyListeners();
  }

  void deleteGuichet(int index) {
    _guichets.removeAt(index);
    notifyListeners();
  }
}
