import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places_app/helper/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void savePlace(String tile, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: tile,
      image: image,
      location: PlaceLocation(latitude: 0.0, longitude: 0.0),
    );
    _items.add(newPlace);
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });
    notifyListeners();
  }
}
