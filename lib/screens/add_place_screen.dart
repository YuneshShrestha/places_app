import 'dart:io';
import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import '../widgets/image_input.dart';
import '../widgets/locataion_input.dart';

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
    const sizedBox = SizedBox(
      height: 8.0,
    );
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
                  sizedBox,
                  ImageInput(
                    onSelectImage: _selectImage,
                  ),
                  sizedBox,
                  const LocationInput(),
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
          ),
        ],
      ),
    );
  }
}
