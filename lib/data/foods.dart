import 'package:flutter/material.dart';
import 'package:uas/models/foodModel.dart';

class FoodListManager with ChangeNotifier {
  List<foodModel> _foodsData = [
    foodModel(
      imagePath: "images/breadimages/Bagel.png",
      text: "Bagel",
      harga: "2.000",
      kategori: "Roti",
      quantity: 0,
    ),
    foodModel(
        imagePath: "images/breadimages/Baguette_De_Campagne.png",
        text: "Baguette De Campagne",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Batard.png",
        text: "Batard",
        harga: "4.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Croissant.png",
        text: "Croissant",
        harga: "3.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Croissant_2.png",
        text: "Croissant_2",
        harga: "4.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Epi_Baguette.png",
        text: "Epi Baguette",
        harga: "4.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Ficelle.png",
        text: "Ficelle",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Flute_Baguette.png",
        text: "Flute Baguette",
        harga: "4.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Fougasse.png",
        text: "Fougasse",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Navette_De_Marseille.png",
        text: "Navette De Marseille",
        harga: "2.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_7_Cereales.png",
        text: "Pain 7 Cereales",
        harga: "1.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_Au_Chocolat.png",
        text: "Pain Au Chocolat",
        harga: "2.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_Au_Levain.png",
        text: "Pain Au Levain",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_Aux_Raisin.png",
        text: "Pain Aux Raisin",
        harga: "4.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_Complet.png",
        text: "Pain Complet",
        harga: "1.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_De_Campagne_Rond.png",
        text: "Pain De Campagne Rond",
        harga: "1.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_De_Mie.png",
        text: "Pain De Mie",
        harga: "2.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_De_Seigle_Noir.png",
        text: "Pain De Seigle Noir",
        harga: "2.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pain_Polka.png",
        text: "Pain Polka",
        harga: "2.500",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Petits_Pains.png",
        text: "Petits Pains",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Pistolet_Bread.png",
        text: "Pistolet_Bread",
        harga: "4.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/breadimages/Tabatiere_bread.png",
        text: "Tabatiere bread",
        harga: "3.000",
        kategori: "Roti",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Bakar.png",
        text: "Ayam Bakar.png",
        harga: "6.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Goreng_Dada.png",
        text: "Ayam Goreng Dada",
        harga: "5.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Goreng_Sayap.png",
        text: "Ayam Goreng Sayap",
        harga: "10.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Goreng_PahaAtas.png",
        text: "Ayam Goreng Paha Atas",
        harga: "5.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Goreng_PahaBwh.png",
        text: "Ayam Goreng Paha Bawah.png",
        harga: "6.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Panggang.png",
        text: "Ayam Panggang",
        harga: "10.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Panggang_1Set.png",
        text: "Ayam Panggang 1 Set",
        harga: "15.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Ayam_Full_Paket.png",
        text: "Ayam Full Paket",
        harga: "15.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/chickenimages/Daging_Bebek_1Set.png",
        text: "Bebe 1 Set ",
        harga: "15.000",
        kategori: "Ayam",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Air_Mineral_3set.png",
        text: "Air Mineral 3 Botol",
        harga: "10.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Air_Mineral.png",
        text: "Air Mineral",
        harga: "3.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Big_CocaCola.png",
        text: "Coca-Cola Besar",
        harga: "7.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/CocaCola.png",
        text: "Coca-Cola",
        harga: "4.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Kaleng_CocaCola.png",
        text: "Coca-Cola Kaleng",
        harga: "4.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Big_Sprite.png",
        text: "Sprite Besar",
        harga: "7.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Sprite.png",
        text: "Sprite",
        harga: "5.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Kaleng_Sprite.png",
        text: "Sprite Kaleng",
        harga: "4.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Jus_Jeruk.png",
        text: "Jus Jeruk",
        harga: "6.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Jus_Wortel.png",
        text: "Jus Wortel",
        harga: "6.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Jus_Tomat.png",
        text: "Jus Tomat",
        harga: "6.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Jus_Alpokat.png",
        text: "Jus Alpokat",
        harga: "7.500",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Susu.png",
        text: "Susu",
        harga: "5.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Teh.png",
        text: "Teh",
        harga: "5.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/drinkimages/Kopi.png",
        text: "Kopi",
        harga: "6.000",
        kategori: "Minuman",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/HotDog.png",
        text: "HotDog",
        harga: "8.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/Donat.png",
        text: "Donat",
        harga: "4.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/Burger.png",
        text: "Burger",
        harga: "6.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/Kentang_Goreng.png",
        text: "Kentang Goreng",
        harga: "7.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/Nugget.png",
        text: "Nugget",
        harga: "9.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/FastFoodImages/Pizza.png",
        text: "Pizza",
        harga: "12.000",
        kategori: "FastFood",
        quantity: 0),
    foodModel(
        imagePath: "images/IceCreamImages/IceCream.png",
        text: "Ice Cream",
        harga: "6.000",
        kategori: "IceCream",
        quantity: 0),
    foodModel(
        imagePath: "images/IceCreamImages/IceCream_ConesWafle.png",
        text: "Ice Cream Cones Wafle",
        harga: "6.500",
        kategori: "IceCream",
        quantity: 0),
    foodModel(
        imagePath: "images/IceCreamImages/IceCream_Magnum.png",
        text: "Ice Cream Magnum",
        harga: "8.000",
        kategori: "IceCream",
        quantity: 0),
    foodModel(
        imagePath: "images/IceCreamImages/IceCream_FullPaket.png",
        text: "Ice Cream Full Paket",
        harga: "10.000",
        kategori: "IceCream",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Katsu_Sando.png",
        text: "Katsu Sando",
        harga: "7.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Mochi.png",
        text: "Mochi",
        harga: "7.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Onigiri.png",
        text: "Onigiri",
        harga: "8.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Sashimi.png",
        text: "Sashimi",
        harga: "10.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Sushi.png",
        text: "Sushi",
        harga: "12.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Takoyaki.png",
        text: "Takoyaki",
        harga: "8.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/japanimages/Udon.png",
        text: "Udon",
        harga: "7.000",
        kategori: "Japan",
        quantity: 0),
    foodModel(
        imagePath: "images/meatballimages/Bakso_Ayam.png",
        text: "Bakso Ayam",
        harga: "6.000",
        kategori: "Bakso",
        quantity: 0),
    foodModel(
        imagePath: "images/meatballimages/Bakso_Ikan.png",
        text: "Bakso Ikan",
        harga: "5.000",
        kategori: "Bakso",
        quantity: 0),
    foodModel(
        imagePath: "images/meatballimages/Mie_Bakso_Ikan.png",
        text: "Mie Bakso Ikan",
        harga: "5.000",
        kategori: "Bakso",
        quantity: 0),
    foodModel(
        imagePath: "images/meatballimages/Mie_Bakso_Ayam.png",
        text: "Mie Bakso Ayam",
        harga: "7.000",
        kategori: "Bakso",
        quantity: 0),
    foodModel(
        imagePath: "images/meatballimages/Mie_Bakso_Ayam_Pangsit_Ceker.png",
        text: "Mie Bakso Ayam Pangsit Ceker",
        harga: "10.000",
        kategori: "Bakso",
        quantity: 0),
    foodModel(
        imagePath: "images/noodleimages/Indomie Polos.png",
        text: "Indomie Polos",
        harga: "5.000",
        kategori: "Mie",
        quantity: 0),
    foodModel(
        imagePath: "images/noodleimages/Indomie_Goreng_Telur.png",
        text: "Indomie Goreng Telur",
        harga: "6.000",
        kategori: "Mie",
        quantity: 0),
    foodModel(
        imagePath: "images/noodleimages/Mie_Hun.png",
        text: "Mie_Hun",
        harga: "10.000",
        kategori: "Mie",
        quantity: 0),
    foodModel(
        imagePath: "images/noodleimages/Mie_Ramen.png",
        text: "Mie_Ramen",
        harga: "8.000",
        kategori: "Mie",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_Lemak.png",
        text: "Nasi Lemak",
        harga: "8.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_SotoAyam.png",
        text: "Nasi Soto Ayam",
        harga: "10.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_Goreng_Polos.png",
        text: "Nasi Goreng Polos",
        harga: "8.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_Goreng_Telur.png",
        text: "Nasi Goreng Telur",
        harga: "10.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_Ayam_Panggang.png",
        text: "Nasi Ayam Panggang",
        harga: "12.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/riceimages/Nasi_Ayam_Hainam.png",
        text: "Nasi Ayam Hainam",
        harga: "12.000",
        kategori: "Nasi",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Cheese_Puffs.png",
        text: "Cheese Puffs",
        harga: "7.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Takis_Xplosion.png",
        text: "Takis Xplosion",
        harga: "6.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Toms_BuffaloWing.png",
        text: "Tom's Buffalo Wing",
        harga: "6.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/GoldFish_Snack_Cracker.png",
        text: "GoldFish Snack Cracker",
        harga: "5.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Cheetos_Colmillos.png",
        text: "Cheetos Colmillos",
        harga: "6.500",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Cheetos_Crunchy.png",
        text: "Cheetos Crunchy",
        harga: "7.500",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Cheetos_PartySize.png",
        text: "Cheetos Party Size",
        harga: "8.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Doritos_Cool_Ranch.png",
        text: "Doritos Cool Ranch",
        harga: "8.500",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Doritos_Nacho_Cheese.png",
        text: "Doritos Nacho Cheese",
        harga: "6.500",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Doritos_Sweet_Chili.png",
        text: "Doritos Sweet Chili",
        harga: "7.500",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/snackimages/Paket_Snack.png",
        text: "Paket_Snack",
        harga: "8.000",
        kategori: "Snack",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Permen_Warna_Warni.png",
        text: "Permen Warna Warni",
        harga: "8.500",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Lolipop.png",
        text: "Lolipop",
        harga: "7.500",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Martabak.png",
        text: "Martabak",
        harga: "7.000",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Donat.png",
        text: "Donat",
        harga: "6.000",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Donat_Strawberry.png",
        text: "Donat Strawberry",
        harga: "6.500",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Donat_Chocolate.png",
        text: "Donat Chocolate",
        harga: "7.000",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Donat_Bacon.png",
        text: "Donat Bacon",
        harga: "7.500",
        kategori: "Sweet",
        quantity: 0),
    foodModel(
        imagePath: "images/sweetimages/Dark_Chocolate.png",
        text: "Dark Chocolate",
        harga: "7.500",
        kategori: "Sweet",
        quantity: 0),
  ];

  Set<foodModel> _CardList = {};

  Set<foodModel> _WishList = {};

  int get cartCount {
    return _CardList.length;
  }

  List<foodModel> get CardList => _CardList.toList();

  List<foodModel> get WishList => _WishList.toList();

  void addChart(value) {
    notifyListeners();
    _CardList.add(value);
    // Calculate(value);
  }

  void removeChart(value) {
    notifyListeners();
    _CardList.remove(value);
    // Calculate(value);
  }

  void addWish(value) {
    notifyListeners();
    _WishList.add(value);
  }

  void removeWish(value) {
    notifyListeners();
    _WishList.remove(value);
  }

  void increase(foodModel value) {
    value.quantity += 1;
    if (_CardList.contains(value)) {
      notifyListeners();
    }
  }


  void decrease(foodModel value) {
    if (value.quantity > 0) {
      value.quantity -= 1;
      if (value.quantity == 0 && _CardList.contains(value)) {
        _CardList.remove(value);
      }
      notifyListeners();
    }
  }


  dynamic _total = 0;

  void Calculate(value) {
    notifyListeners();
    _total += value.quantity * value.harga;
  }

  void Clear(){
    _CardList = {};
    notifyListeners();
  }

  int get totalPrice {
  if (_CardList.isEmpty) {
    print("Kosong");
    return 0;
  }

  int total = 0;

  for (foodModel i in _CardList) {
    total += int.parse(i.harga.replaceAll('.', '')) * i.quantity;
  }

  return total;
}


  dynamic get total => _total;
  List<foodModel> get foodlist => _foodsData;
}
