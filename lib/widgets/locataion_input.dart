import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;
  Future<void> _getCurrentUserLocation() async {
    LocationData userLocation = await Location().getLocation();
    print("Lat: ${userLocation.latitude} , Long: ${userLocation.longitude} ");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          child: _previewImage == null
              ? const Text("Location has not been selected")
              : Image.network(
                  _previewImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                _getCurrentUserLocation();
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
            ),
            const SizedBox(
              width: 10.0,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Select on map"),
            )
          ],
        ),
      ],
    );
  }
}
