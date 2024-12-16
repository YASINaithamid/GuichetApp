


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/guichet_provider.dart';
import '../models/guichet.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class AddGuichetScreen extends StatefulWidget {
  

  @override
  _AddGuichetScreenState createState() => _AddGuichetScreenState();
}

class _AddGuichetScreenState extends State<AddGuichetScreen> {
  final _nameController = TextEditingController();
  String? _selectedRole; 
  String? _selectedStatus; 
  File? _selectedImage; 

  // Predefined dropdown values
  final List<String> _roles = ['Admin', 'User', 'Viewer'];
  final List<String> _statuses = ['Active', 'Inactive', 'Pending'];

  final _imagePicker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_nameController.text.isEmpty ||
        _selectedRole == null ||
        _selectedStatus == null ||
        _selectedImage == null 
       ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields and select an image!')),
      );
      return;
    }

 
  }

  @override
  Widget build(BuildContext context) {
     final guichetProvider = Provider.of<GuichetProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un nouveau guichet'),
      ),
      body:SingleChildScrollView(
  child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: (){},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? Icon(Icons.add_a_photo, size: 40, color: Colors.grey)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Formats autorisés : .png et .svg\nTaille maximale autorisée : 2 Mo\nDimensions idéales de l\'image : 100px × 100 px',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom de guichet',border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Dropdown for Role
            DropdownButtonFormField<String>(
              value: _selectedRole,
              items: _roles
                  .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              decoration: InputDecoration(labelText: 'Role',border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Dropdown for Status
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              items: _statuses
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
              decoration: InputDecoration(labelText: 'Statut',border: OutlineInputBorder(),),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              child: Text('Valider'),
              onPressed:(() {
                _submitForm();
                final newGuichet = Guichet(
                  icon:  _selectedImage!.path.toString(),
                  name: _nameController.text.toString(),
                  role: _selectedRole.toString(),
                  status: _selectedStatus.toString(),
                );
                guichetProvider.addGuichet(newGuichet);
                Navigator.pop(context);
              } 
              
            ))
          ],
        ),
      )),
    );
  }
}

