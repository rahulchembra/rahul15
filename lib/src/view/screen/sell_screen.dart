import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:erevive/src/view/screen/sell_conform.dart';
import 'package:dotted_border/dotted_border.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  String selectedCategory = '';
  TextEditingController descriptionController = TextEditingController();
  TextEditingController info1Controller = TextEditingController();
  TextEditingController info2Controller = TextEditingController();
  TextEditingController info3Controller = TextEditingController();
  XFile? imageFile;
  final ImagePicker imagePicker = ImagePicker();
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sell E-Waste',
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        titleSpacing: 60.0, // Adjust the value as needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              const Text(
                'Provide details of E-waste here',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              buildTextField(
                controller: descriptionController,
                labelText: 'Description',
                errorText: submitted && descriptionController.text.isEmpty
                    ? 'This field is mandatory'
                    : null,
              ),
              const SizedBox(height: 20),
              buildTextField(
                controller: info1Controller,
                labelText: 'Address & PIN Code',
                errorText: submitted && info1Controller.text.isEmpty
                    ? 'This field is mandatory'
                    : null,
              ),
              const SizedBox(height: 20),
              buildTextField(
                controller: info2Controller,
                labelText: 'Google map location link',
                errorText: submitted && info2Controller.text.isEmpty
                    ? 'This field is mandatory'
                    : null,
              ),
              const SizedBox(height: 20),
              buildTextField(
                controller: info3Controller,
                labelText: 'Phone Number',
                keyboardType: TextInputType
                    .number, // Set keyboardType to TextInputType.number
                errorText: submitted && info3Controller.text.isEmpty
                    ? 'This field is mandatory'
                    : null,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromARGB(97, 177, 164, 43),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            submitted = true;
                          });
                          showPictureDialog();
                        },
                        child: const Center(
                          child: Text(
                            'Pick Image',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Container(
                margin: const EdgeInsets.all(20),
                width: size.width,
                height: 250,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: const Color.fromARGB(255, 86, 184, 234),
                  strokeWidth: 1,
                  dashPattern: const [5, 5],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox.expand(
                      child: FittedBox(
                        child: imageFile != null
                            ? Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.image_outlined,
                                color: Color.fromARGB(255, 106, 129, 139),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 30.0, right: 25.0),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(70),
          child: Container(
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: const Color.fromARGB(54, 142, 179, 21),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(70),
              color: const Color.fromARGB(70, 101, 12, 12),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onSubmit,
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    TextInputType keyboardType =
        TextInputType.text, // Add keyboardType parameter with a default value
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: null,
          keyboardType: keyboardType, // Set keyboardType here
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            errorText: errorText,
          ),
        ),
      ],
    );
  }

  bool isFormValid() {
    return descriptionController.text.isNotEmpty &&
        info1Controller.text.isNotEmpty &&
        info2Controller.text.isNotEmpty &&
        info3Controller.text.isNotEmpty &&
        imageFile != null;
  }

  void onSubmit() {
    setState(() {
      submitted = true;
    });

    // Check if all fields are filled
    if (!isFormValid()) {
      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields and select an image.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubmitPage(
            imageFile: imageFile!,
            description: descriptionController.text,
            address: info1Controller.text,
            locationLink: info2Controller.text,
            phoneNumber: info3Controller.text,
          ),
        ),
      );
    }
  }

  Future<void> showPictureDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Action'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                getFromCamera();
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10),
                  Text('Open Camera'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                getFromGallery();
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(Icons.photo_library),
                  SizedBox(width: 10),
                  Text('Open Gallery'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // get from gallery
  Future<void> getFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
    }
  }

  // get from camera
  Future<void> getFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
    }
  }
}
