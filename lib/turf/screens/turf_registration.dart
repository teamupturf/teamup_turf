import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teamup_turf/turf/screens/turf_homepage.dart';
import 'package:teamup_turf/turf/services/turf_auth_services.dart';

class TurfRegistrationForm extends StatefulWidget {
  const TurfRegistrationForm({super.key});

  @override
  State<TurfRegistrationForm> createState() => _TurfRegistrationFormState();
}

class _TurfRegistrationFormState extends State<TurfRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _turfNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fairController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  File? _selectedDocument;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  Future<void> register({required String turfName, required String location,required String contact,required String address,required String fair,required File documentFile,required String email,required String password})async{
  isLoading = true;
  setState(() {
    
  });
  try{
    String result = await AuthServivices().turfRegister(turfName: turfName, location: location, contact: contact, address: address, fair: fair, documentUrl: documentFile, email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result),)
    ); 
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString()),)
    );
  }finally{
    isLoading = false;
    setState(() {
      
    });

}
  }

  Future<void> _pickDocument() async {
    final XFile? document =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedDocument = File(document!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("Turf Registration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Turf Name Field
              _buildTextField(
                controller: _turfNameController,
                labelText: "Turf Name",
                icon: Icons.sports_soccer,
                validatorMessage: "Please enter the turf name",
              ),
              const SizedBox(height: 16),
              // Location Field
              _buildTextField(
                controller: _locationController,
                labelText: "Location",
                icon: Icons.location_on,
                validatorMessage: "Please enter the location",
              ),
              const SizedBox(height: 16),
              // Contact Field
              _buildTextField(
                controller: _contactController,
                labelText: "Contact",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validatorMessage: "Please enter a valid contact number",
              ),
              const SizedBox(height: 16),
              // Address Field
              _buildTextField(
                controller: _addressController,
                labelText: "Address",
                icon: Icons.home,
                validatorMessage: "Please enter the address",
              ),
              const SizedBox(height: 16),
              // Fair Field
              _buildTextField(
                controller: _fairController,
                labelText: "Fair",
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validatorMessage: "Please enter the fair",
              ),
              const SizedBox(height: 16),
              // Email Field
              _buildTextField(
                controller: _emailController,
                labelText: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validatorMessage: "Please enter a valid email",
              ),
              const SizedBox(height: 16),
              // Password Field
              _buildTextField(
                controller: _passwordController,
                labelText: "Password",
                icon: Icons.lock,
                obscureText: true,
                validatorMessage: "Password must be at least 6 characters",
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
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor:isLoading?Colors.transparent: Colors.green[700],
                  ),
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      await register(turfName: _turfNameController.text, location: _locationController.text, contact: _contactController.text, address: _addressController.text, fair: _fairController.text, documentFile: _selectedDocument!, email: _emailController.text, password: _passwordController.text);

                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TurfHomePage(),));
                    }
                  },
                  child:isLoading? const CircularProgressIndicator(color: Colors.green,): const Text(
                    "Register Turf",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required String validatorMessage,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
      ),
    );
  }
}
