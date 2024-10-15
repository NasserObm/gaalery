// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gaalery/photo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => PictureState();
}

class PictureState extends State<Picture> {
  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhoto();
  }

  Future<void> fetchPhoto() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        setState(() {
          photos = data.map((json) => Photo.fromJson(json)).toList();
        });
      } else {
        throw Exception('Erreur lors du chargement des images');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Erreur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27282E),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Picture',
                      style: GoogleFonts.milonga(
                        color: Colors.white,
                        fontSize: 34,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xffffffff),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.menu,
                          color: Color(0xffffffff),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 7.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          photos[index].url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
