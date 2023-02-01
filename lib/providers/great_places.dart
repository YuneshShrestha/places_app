import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places_app/helper/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });
    notifyListeners();
  }

  Future<void> setData() async {
    final fetchedData = await DBHelper.fetchData('user_places');
    _items = fetchedData
        .map(
          (data) => Place(
            id: data['id'].toString(),
            title: data['title'].toString(),
            location: PlaceLocation(
              latitude: 0.0,
              longitude: 0.0,
            ),
            image: File(
              data['image'].toString(),
            ),
          ),
        )
        .toList();
  }
}
