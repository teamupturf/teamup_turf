import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';  // Add intl package for date formatting

import 'package:teamup_turf/admin/admin_news_details_screen.dart';

class NewsUpdateScreen extends StatefulWidget {
  @override
  _NewsUpdateScreenState createState() => _NewsUpdateScreenState();
}

class _NewsUpdateScreenState extends State<NewsUpdateScreen> {
  List<Map<String, dynamic>> newsList = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Method to show the add news dialog
  void _showAddNewsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Add News',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: const Text(
                  "Select Image",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    fixedSize: Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(
                    _selectedImage!,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                titleController.clear();
                descriptionController.clear();
                setState(() {
                  _selectedImage = null;
                });
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addNews();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // Method to add news to the list with current date
  void _addNews() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _selectedImage != null) {
      final String formattedDate = DateFormat('yMMMd').format(DateTime.now());
      setState(() {
        newsList.add({
          'title': titleController.text,
          'description': descriptionController.text,
          'image': _selectedImage,
          'date': formattedDate,
        });
      });
      titleController.clear();
      descriptionController.clear();
      _selectedImage = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("News Update", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
         
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        title: newsList[index]['title'],
                        description: newsList[index]['description'],
                        image: newsList[index]['image'], date: newsList[index]['date'],
                        onDelete: () {
                          
                        },
                      ),
                    ),
                  );
                },
                tileColor: Colors.white,
                contentPadding: const EdgeInsets.all(16.0),
                leading: newsList[index]['image'] != null
                    ? Image.file(
                        newsList[index]['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image, size: 80, color: Colors.grey),
                title: Text(
                  newsList[index]['title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green),
                ),
                subtitle: Text(
                  newsList[index]['date'] ?? '',  // Display the date
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.green.shade800),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddNewsDialog,
        label: const Text("Add News", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green.shade800,
      ),
    );
  }
}
