import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? image;
  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      image = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await image!.copy('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          child: image == null
              ? const Center(
                  child: Text(
                    "No Image Added",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                )
              : Image.file(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: const Text("Take Picture"),
        )
      ],
    );
  }
}
