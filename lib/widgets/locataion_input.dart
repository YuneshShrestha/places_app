import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';
import 'package:location/location.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;
  double latitude = 23;
  double lognitude = 80;

  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();
  }

  Future<void> _getCurrentUserLocation() async {
    LocationData userLocation = await Location().getLocation();
    latitude = userLocation.latitude!;
    lognitude = userLocation.longitude!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: OpenStreetMapSearchAndPick(
          center: LatLong(latitude, lognitude),
          buttonColor: Colors.blue,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            PlaceLocation(
              latitude: pickedData.latLong.latitude,
              longitude: pickedData.latLong.longitude,
              address: pickedData.address,
            );
            /*
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            */
          }),
    );
    // return Column(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: Colors.grey,
    //           width: 1.0,
    //         ),
    //       ),
    //       width: double.infinity,
    //       height: 170,
    //       alignment: Alignment.center,
    //       child: _previewImage == null
    //           ? const Text("Location has not been selected")
    //           : Image.network(
    //               _previewImage!,
    //               width: double.infinity,
    //               fit: BoxFit.cover,
    //             ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         TextButton.icon(
    //           onPressed: () {
    //             _getCurrentUserLocation();
    //           },
    //           icon: const Icon(Icons.location_on),
    //           label: const Text("Current Location"),
    //         ),
    //         const SizedBox(
    //           width: 10.0,
    //         ),
    //         TextButton.icon(
    //           onPressed: () {},
    //           icon: const Icon(Icons.map),
    //           label: const Text("Select on map"),
    //         )
    //       ],
    //     ),
    //   ],
    // );
  }
}
