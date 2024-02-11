import 'package:assignment_submission/photo.dart';
import 'package:assignment_submission/photo_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = _fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Gallery App",
        ),
      ),
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    leading: Image.network(
                      snapshot.data![index].thumbnailUrl,
                      width: 50,
                      height: 50,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoDetailScreen(
                            photo: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Photo>> _fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<Photo>.from(list.map((model) => Photo.fromJson(model)));
    } else {
      throw Exception('Failed to load photos');
    }
  }

}