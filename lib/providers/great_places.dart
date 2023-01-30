import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _greatPlaces = [];
  List<Place> get greatPlaces {
    return [..._greatPlaces];
  }
}
