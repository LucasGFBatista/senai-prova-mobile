import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _nameController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 40,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveChanges();
              },
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    String newName = _nameController.text;
    String newPassword = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('As senhas não coincidem. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Alterações salvas com sucesso!'),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
