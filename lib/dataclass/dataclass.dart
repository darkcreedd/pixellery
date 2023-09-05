import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pixellery/models/models.dart';

class DataClass extends ChangeNotifier {
  int pageNumber = 1;

  List<PexelsPhoto> curatedPhotos = [];
  List<PexelsPhoto> searchedPhotos = [];
  Future<List<PexelsPhoto>>? searchedPhotos1;
  Future<List<PexelsPhoto>>? shared;

  Future<List<PexelsPhoto>>? fetchSearchedPictures(String query) async {
    final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query'),
        headers: {
          'Authorization':
              'aFQuWfaLWZgParsfpdzDEcOJNuaX3nFFXT2gLm0T16KRbbEiRMUuwRco',
        });

    if (response.statusCode == 200) {
      var fetched = jsonDecode(response.body);
      var fetchedPhotos = fetched['photos'];
      searchedPhotos = [];

      for (int i = 0; i < fetchedPhotos.length; i++) {
        PexelsPhoto photo = PexelsPhoto(
            id: fetchedPhotos[i]['id'],
            imageUrl: fetchedPhotos[i]['src']['original'],
            photographer: fetchedPhotos[i]['photographer'],
            downloaded: false,
            liked: fetchedPhotos[i]['liked'],
            alt: fetchedPhotos[i]['alt']);
        searchedPhotos.add(photo);
        debugPrint(searchedPhotos.toString());
      }
      debugPrint(fetchedPhotos.toString());

      return searchedPhotos;
    } else {
      throw Exception('Failed to load pictures');
    }
  }

  Future<List<PexelsPhoto>> fetchPictures(int pageNumber) async {
    final response = await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/curated?page=$pageNumber&per_page=40'),
        headers: {
          'Authorization':
              'aFQuWfaLWZgParsfpdzDEcOJNuaX3nFFXT2gLm0T16KRbbEiRMUuwRco',
        });

    if (response.statusCode == 200) {
      var fetched = jsonDecode(response.body);
      var fetchedPhotos = fetched['photos'];
      curatedPhotos = [];

      for (int i = 0; i < fetchedPhotos.length; i++) {
        PexelsPhoto photo = PexelsPhoto(
            id: fetchedPhotos[i]['id'],
            imageUrl: fetchedPhotos[i]['src']['original'],
            photographer: fetchedPhotos[i]['photographer'],
            downloaded: false,
            liked: fetchedPhotos[i]['liked'],
            alt: fetchedPhotos[i]['alt']);
        curatedPhotos.add(photo);
        debugPrint(curatedPhotos.toString());
      }

      return curatedPhotos;
    } else {
      throw Exception('Failed to load pictures');
    }
  }

  List<PexelsPhoto> savedList = [];
  void save(
    int id,
    String imageUrl,
    String photographer,
    bool downloaded,
    bool liked,
    String alt,
  ) {
    PexelsPhoto saved = PexelsPhoto(
        id: id,
        imageUrl: imageUrl,
        photographer: photographer,
        downloaded: downloaded,
        liked: liked,
        alt: alt);

    List<PexelsPhoto> newPhotos = [];
    bool found = false;

    for (PexelsPhoto photo in savedList) {
      if (photo.id == id) {
        photo.downloaded = downloaded;
        photo.liked = liked;
        found = true;
        break;
      }
    }

    if (!found) {
      newPhotos.add(saved);
    }

    savedList.addAll(newPhotos);

    notifyListeners();
  }

  void unsave(int id) {
    savedList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // void nextPage(int pageNumber) {
  //   // Load the next page of data here
  //   pageNumber += 1;

  //   photos = fetchPictures(pageNumber);

  //   notifyListeners();
  // }
}
