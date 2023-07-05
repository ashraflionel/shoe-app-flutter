import 'package:flutter/services.dart' as the_bundle;
import 'package:shoe_app/Models/sneakers_model.dart';

class Helper {
  //Male
  Future<List<Sneakers>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    return maleList;
  }

  //Female
  Future<List<Sneakers>> getFeMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final feMaleList = sneakersFromJson(data);
    return feMaleList;
  }

  //Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    final data = await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakersFromJson(data);
    return kidsList;
  }

  //Male GetByID
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneakers = maleList.firstWhere((Sneakers) => Sneakers.id == id);
    return sneakers;
  }

  //FeMale GetByID
  Future<Sneakers> getFeMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = sneakersFromJson(data);
    final sneakers = femaleList.firstWhere((Sneakers) => Sneakers.id == id);
    return sneakers;
  }

  //Kids GetByID
  Future<Sneakers> getKidsSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kids = sneakersFromJson(data);
    final sneakers = kids.firstWhere((Sneakers) => Sneakers.id == id);
    return sneakers;
  }
}
