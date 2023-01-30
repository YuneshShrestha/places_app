import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place-screen";
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
  File? pickedImage;
  void _selectImage(File pickedImage) {
    this.pickedImage = pickedImage;
  }

  void _savePlace() {
    if (titleController.text.isEmpty || pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .savePlace(titleController.text, pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Place"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      label: Text("Title"),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ImageInput(
                    onSelectImage: _selectImage,
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // maximumSize: const Size(double.infinity, 10),
              ),
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          )
        ],
      ),
    );
  }
}
