import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teamup_turf/user/screens/root_screen.dart';
import 'package:teamup_turf/user/services/user_auth_services.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedGender;

  File? _selectedDocument;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  

  Future<void> _pickDocument() async {
    final XFile? document =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedDocument = File(document!.path);
    });
  }

  @override
  void dispose() {
    _playerNameController.dispose();
    _mobileController.dispose();
    _positionController.dispose();
    _availabilityController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registerUser() async{
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      final playerName = _playerNameController.text.trim();
      final gender = _selectedGender;
      final mobile = _mobileController.text.trim();
      final position = _positionController.text.trim();
      final availability = _availabilityController.text.trim();
      final location = _locationController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      try{
        String result = await UserAuthServices().userRegister(playerName: playerName, gender: _selectedGender.toString(), mobile: mobile, position: position, avaialabilty: availability, imageUrl: _selectedDocument!, location: location, email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen()
        ),
      );
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }finally{
        setState(() {
          isLoading = false;
        });
      }
      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2.0),
      ),
      labelStyle: TextStyle(fontSize: 16, color: Colors.green),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _playerNameController,
                decoration: inputDecoration.copyWith(labelText: 'Player Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: inputDecoration.copyWith(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select your gender' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _mobileController,
                decoration: inputDecoration.copyWith(labelText: 'Mobile'),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your mobile number' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _positionController,
                decoration: inputDecoration.copyWith(labelText: 'Position'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your position' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _availabilityController,
                decoration: inputDecoration.copyWith(labelText: 'Availability'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your availability' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: inputDecoration.copyWith(labelText: 'Location'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your location' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: inputDecoration.copyWith(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty || !value.contains('@')
                    ? 'Please enter a valid email'
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: inputDecoration.copyWith(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
              ),
              const SizedBox(height: 16),
              // Document Upload
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upload Document",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _pickDocument,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white
                    ),
                    child: const Text("Choose File",),
                  ),
                ],
              ),
              if (_selectedDocument != null)
                Text(
                  "Selected File: ${_selectedDocument!.path}",
                  style: const TextStyle(color: Colors.black54),
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child:isLoading?CircularProgressIndicator(color: Colors.white,): const Text(
                    'Register',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


