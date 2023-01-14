class Shop {
  final String shop_name;
  final String shop_floor_label;
  final String shop_image;
  final String shop_logo;
  //Constructor
  Shop(
      {required this.shop_name,
      required this.shop_floor_label,
      required this.shop_image,
      required this.shop_logo});
}

class Floor {
  final String floor_name;
  final String floor_abbrev;
  final String floor_image;

  //Constructor
  Floor({
    required this.floor_name,
    required this.floor_abbrev,
    required this.floor_image,
  });
}

class FloorPlan {
  List<Floor> floors;
  List<Shop> shops;
  //Constructor
  FloorPlan(this.floors, this.shops);
}

//==============================Initations===================================//

//Mall 1

List<Shop> allShops = [
  //=======================First Floor Shops of Mall 1===============================
  Shop(
      shop_name: 'Mang Inasal',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/1.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/MangInasal.png'),
  Shop(
      shop_name: 'Jollibee',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/2.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/Jollibee.png'),
  Shop(
      shop_name: 'Kentucky Fried Chicken',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/3.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/KentuckyFriedChicken.png'),
  Shop(
      shop_name: 'McDonalds',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/4.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/McDonald.png'),
  Shop(
      shop_name: 'Starbucks',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/5.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/Starbucks.png'),
  Shop(
      shop_name: 'Jco',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/6.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/Jco.png'),
  Shop(
      shop_name: 'KangarooJack',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/7.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/KangarooJack.jpg'),
  Shop(
      shop_name: 'Racks',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/8.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/Racks.png'),
  Shop(
      shop_name: 'Sbarro',
      shop_floor_label: 'Ground Floor',
      shop_image: 'assets/FirstFloor/9.jpg',
      shop_logo: 'assets/ShopLogos/1stFloor/Sbarro.png'),

  //===================================Second Floor Shops of Mall 1 ============================================
  Shop(
      shop_name: 'Burberry',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/1.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Burberry.jpg'),
  Shop(
      shop_name: 'Bata',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/2.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Bata.png'),
  Shop(
      shop_name: 'Gucci',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/3.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Gucci.png'),
  Shop(
      shop_name: 'Chanel',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/4.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Chanel.png'),
  Shop(
      shop_name: 'Penshoppe',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/5.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Penshoppe.png'),
  Shop(
      shop_name: 'Forme',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/6.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Forme.jpg'),
  Shop(
      shop_name: 'Freeway',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/7.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Freeway.png'),
  Shop(
      shop_name: 'Glamour',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/8.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Glamour.jpg'),
  Shop(
      shop_name: 'Bench',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/9.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Bench.png'),
  Shop(
      shop_name: 'Her Bench',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/10.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/HerBench.png'),
  Shop(
      shop_name: 'Guess',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/11.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Guess.png'),
  Shop(
      shop_name: 'Jag',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/12.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Jag.png'),
  Shop(
      shop_name: 'Rusty Lopez',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/13.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/RustyLopez.png'),
  Shop(
      shop_name: 'Gibi Shoes',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/14.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/GibiShoes.jpg'),
  Shop(
      shop_name: 'Figlia',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/15.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Figlia.jpg'),
  Shop(
      shop_name: 'Mendez',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/16.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Mendez.png'),
  Shop(
      shop_name: 'Parisian',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/17.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Parisian.png'),
  Shop(
      shop_name: 'World Balance',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/18.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/WorldBalance.png'),
  Shop(
      shop_name: 'Wagi Originals',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/19.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/WagiOriginals.png'),
  Shop(
      shop_name: 'Banana Peel',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/20.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/BananaPeel.png'),
  Shop(
      shop_name: 'Sketchers',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/21.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Sketchers.png'),
  Shop(
      shop_name: 'Fila',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/23.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Fila.png'),
  Shop(
      shop_name: 'Asics',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/24.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Asics.png'),
  Shop(
      shop_name: 'Nike',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/25.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Nike.png'),
  Shop(
      shop_name: 'Adidas',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/26.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Adidas.png'),
  Shop(
      shop_name: 'New Balance',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/29.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/NewBalance.png'),
  Shop(
      shop_name: 'BLK 513',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/30.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Blk513.png'),
  Shop(
      shop_name: 'Cold Stone Creamery',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/31.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/ColdStoneCreamery.png'),
  Shop(
      shop_name: 'Marugame Udon',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/32.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/MarugameUdon.png'),
  Shop(
      shop_name: 'Genki Sushi',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/33.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/GenkiSushi.png'),
  Shop(
      shop_name: 'Tim Ho Wan',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/34.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/TimHoWan.jpg'),
  Shop(
      shop_name: 'Ramen Nagi',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/35.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/RamenNagi.png'),
  Shop(
      shop_name: 'Teppanya',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/36.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Teppanya.jpg'),
  Shop(
      shop_name: 'Blake Wings and Steak',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/37.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/BlakeWingsandStake.png'),
  Shop(
      shop_name: 'Soban K-Town Grill',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/38.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/SobanKTownGrill.png'),
  Shop(
      shop_name: 'Frankies',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/39.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Frankies.png'),
  Shop(
      shop_name: 'Dohtonbori',
      shop_floor_label: '2nd Floor',
      shop_image: 'assets/SecondFloor/40.jpg',
      shop_logo: 'assets/ShopLogos/2ndFloor/Dohtonbori.jpg'),

  //================== Third Floor Shops of Mall 1 ===============================
  Shop(
      shop_name: 'Baleno',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/1.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Baleno.jpg'),
  Shop(
      shop_name: 'City Lady',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/2.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/CityLady.png'),
  Shop(
      shop_name: 'Bio Fresh',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/3.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/BioFresh.jpg'),
  Shop(
      shop_name: 'Coco Cabana',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/4.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/CocoCabana.jpg'),
  Shop(
      shop_name: 'Crocs',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/5.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Crocs.png'),
  Shop(
      shop_name: 'Concepts',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/6.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Concepts.jpg'),
  Shop(
      shop_name: 'Ecco',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/7.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Ecco.png'),
  Shop(
      shop_name: 'Elle',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/8.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Elle.png'),
  Shop(
      shop_name: 'Fashion Amore',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/9.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/FashionAmore.png'),
  Shop(
      shop_name: 'Grab',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/10.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Grab.png'),
  Shop(
      shop_name: 'Fashion Amore',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/11.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/FashionAmore.png'),
  Shop(
      shop_name: 'Jovanni',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/12.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Jovanni.png'),
  Shop(
      shop_name: 'Karutora',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/13.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Karutora.jpg'),
  Shop(
      shop_name: 'Keds',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/14.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Keds.jpg'),
  Shop(
      shop_name: 'Kicks',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/15.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Kicks.png'),
  Shop(
      shop_name: 'Secosana',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/17.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Secosana.png'),
  Shop(
      shop_name: 'AXN',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/18.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/AXN.png'),
  Shop(
      shop_name: 'Baleno',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/19.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Baleno.jpg'),
  Shop(
      shop_name: 'Beverly Hills Polo Club',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/20.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/BeverlyHillsPoloClub.png'),
  Shop(
      shop_name: 'Burlington',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/21.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Burlington.jpg'),
  Shop(
      shop_name: 'Coco Republic',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/22.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/CocoRepublic.png'),
  Shop(
      shop_name: 'Darlington',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/23.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Darlington.png'),
  Shop(
      shop_name: 'Detail',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/24.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Detail.png'),
  Shop(
      shop_name: 'Jockey',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/25.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Jockey.png'),
  Shop(
      shop_name: 'Levis',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/26.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Levis.png'),
  Shop(
      shop_name: 'Mens Club',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/27.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/MensClub.png'),
  Shop(
      shop_name: 'Milanos',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/28.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Milanos.png'),
  Shop(
      shop_name: 'Tee Culture',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/29.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/TeeCulture.png'),
  Shop(
      shop_name: 'Fisher Price',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/30.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/FisherPrice.jpg'),
  Shop(
      shop_name: 'Hello Kitty',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/31.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/HelloKitty.png'),
  Shop(
      shop_name: 'Hush Hush',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/32.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/HushHush.png'),
  Shop(
      shop_name: 'JusTees',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/33.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/JusTees.png'),
  Shop(
      shop_name: 'Nap',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/34.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/Nap.png'),
  Shop(
      shop_name: 'Puffy & Sparky',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/35.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/PuffyandSparky.jpg'),
  Shop(
      shop_name: 'SM Basics',
      shop_floor_label: '3rd Floor',
      shop_image: 'assets/ThirdFloor/36.jpg',
      shop_logo: 'assets/ShopLogos/3rdFloor/SMBasics.png'),
];

List<Floor> floors_of_FP1 = [
  Floor(
    floor_name: 'Ground Floor',
    floor_abbrev: 'GF',
    floor_image: 'assets/FirstFloor/1stFloor.jpg',
  ),
  Floor(
    floor_name: '2nd Floor',
    floor_abbrev: '2F',
    floor_image: 'assets/SecondFloor/secondFloor.jpg',
  ),
  Floor(
    floor_name: '3rd Floor',
    floor_abbrev: '3F',
    floor_image: 'assets/ThirdFloor/thirdFloor.jpg',
  ),
];

//Floorplan for the mall
FloorPlan floorplan1 = FloorPlan(floors_of_FP1, allShops);

//============================================================================
