import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import './screens/add_place_screen.dart';
import './screens/place_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0xffEAE7B1),
            )),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const PlaceListScreen(),
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
