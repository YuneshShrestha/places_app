import 'package:flutter/material.dart';
import 'package:great_places_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place-screen";
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
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
                  const ImageInput(),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPrimary: Theme.of(context).colorScheme.onSecondary,
                // maximumSize: const Size(double.infinity, 10),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          )
        ],
      ),
    );
  }
}
