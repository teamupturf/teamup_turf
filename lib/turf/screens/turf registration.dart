import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TurfRegistrationFormState extends StatefulWidget {
<<<<<<< HEAD
  TurfRegistrationFormState({super.key});

  @override
  State<TurfRegistrationFormState> createState() =>
      _TurfRegistrationFormStateState();
=======

  TurfRegistrationFormState({super.key});

  @override
  State<TurfRegistrationFormState> createState() => _TurfRegistrationFormStateState();
>>>>>>> 57b34965fb995c766855873362ce5b447b97e2c2
}

class _TurfRegistrationFormStateState extends State<TurfRegistrationFormState> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _timeSlotsController = TextEditingController();

  XFile? _selectedDocument;

  XFile? _selectedLogo;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickDocument() async {
    final XFile? document =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedDocument = document;
    });
  }

  Future<void> _pickLogo() async {
    final XFile? logo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedLogo = logo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Turf Registration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the turf name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Location Field
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: "Location",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the location";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Time Slots Field
              TextFormField(
                controller: _timeSlotsController,
                decoration: const InputDecoration(
                  labelText: "Available Time Slots",
                  hintText: "e.g., 8 AM - 10 PM",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the available time slots";
                  }
                  return null;
                },
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
                    child: const Text("Choose File"),
                  ),
                ],
              ),
              if (_selectedDocument != null)
                Text(
                  "Selected File: ${_selectedDocument!.name}",
                  style: const TextStyle(color: Colors.black12),
                ),
              const SizedBox(height: 16),
              // Logo Upload
              // Logo Upload Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upload Logo (Optional)", // Add optional label
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _pickLogo,
                    child: const Text("Choose Logo"),
                  ),
                ],
              ),
// Display selected logo if available
              if (_selectedLogo != null)
                Text(
                  "Selected Logo: ${_selectedLogo!.name}",
                  style: const TextStyle(color: Colors.black12),
                ),

              const SizedBox(height: 32),
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted')),
                      );
                    }
                  },
                  child: const Text(
                    "Register Turf",
                    style: TextStyle(fontSize: 16),
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
