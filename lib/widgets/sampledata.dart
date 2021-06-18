import 'package:food_app/widgets/foodwidget.dart';

class Cart {
  Cart(this.foodId, this.name, this.quantity, this.price, this.url);
  String foodId;
  String name;
  int quantity;
  double price;
  String url;
}

class Category {
  const Category(this.category, this.iconUrl);
  final String category;
  final String iconUrl;
}

class Menu {
  const Menu(this.id, this.name, this.price, this.url, this.category);
  final String id;
  final String name;
  final double price;
  final String url;
  final String category;
}

class Promotion {
  const Promotion(this.status, this.promoCode, this.url);
  final bool status;
  final String promoCode;
  final String url;
}

class Profile {
  const Profile(this.user, this.email, this.phone, this.location);
  final user;
  final email;
  final phone;
  final location;
}

class Order {
  const Order(this.orderId, this.customerEmail, this.status, this.cart,
      this.via, this.location, this.time, this.paymentMethod);
  final String orderId;
  final String customerEmail;
  final int status;
  final List<Cart> cart;
  final int via;
  final String location;
  final DateTime time;
  final int paymentMethod;
}

class FoodList {
  const FoodList(this.foodId, this.name, this.url, this.quantity);
  final String foodId;
  final String name;
  final String url;
  final int quantity;
}

List<Cart> cart = <Cart>[];
List<Order> order = <Order>[];
//List<FoodList> foodList = <FoodList>[];

List<Profile> profiles = <Profile>[
  const Profile(
      "John Doe", "joe.doe@gmail.com", "+601119996665", "Kuala Lumpur"),
];

List<Menu> menus = <Menu>[
  const Menu(
      '928819991',
      'Special Cheesy',
      20,
      "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '33333333',
      'Hot Cheesy',
      15,
      "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '928819994241',
      'Meatlover',
      15,
      "https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?cs=srgb&dl=pexels-edward-eyer-1049626.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '253525222',
      'Uncle Special',
      15,
      "https://images.pexels.com/photos/2762939/pexels-photo-2762939.jpeg?cs=srgb&dl=pexels-ana-madeleine-uribe-2762939.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '888676464',
      'Beef paperoni',
      25,
      "https://images.pexels.com/photos/4394612/pexels-photo-4394612.jpeg?cs=srgb&dl=pexels-natasha-filippovskaya-4394612.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '4252353',
      'Hawaian',
      35,
      "https://images.pexels.com/photos/4109077/pexels-photo-4109077.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-4109077.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '52325666',
      'Chef Specials',
      13,
      "https://images.pexels.com/photos/4193881/pexels-photo-4193881.jpeg?cs=srgb&dl=pexels-ponyo-sakana-4193881.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '534536363',
      'Pasta la vista',
      20,
      "https://images.pexels.com/photos/6287548/pexels-photo-6287548.jpeg?cs=srgb&dl=pexels-klaus-nielsen-6287548.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '76868686',
      'Carbonara Pasta',
      23,
      "https://images.pexels.com/photos/1256875/pexels-photo-1256875.jpeg?cs=srgb&dl=pexels-lgh-1256875.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '2342626262',
      'Bolognise Pasta',
      14,
      "https://images.pexels.com/photos/5419336/pexels-photo-5419336.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-5419336.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '62626222',
      'Aglio Olio Pasta',
      33,
      "https://images.pexels.com/photos/5507643/pexels-photo-5507643.jpeg?cs=srgb&dl=pexels-jess-vide-5507643.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      '765757555',
      'Lasagne',
      22,
      "https://images.pexels.com/photos/5949890/pexels-photo-5949890.jpeg?cs=srgb&dl=pexels-alleksana-5949890.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
];

List<Category> categories = <Category>[
  const Category(
      "Pizza", "https://image.flaticon.com/icons/png/512/432/432339.png"),
  const Category(
      "Pasta", "https://image.flaticon.com/icons/png/512/2427/2427088.png"),
  const Category(
      "Sides", "https://image.flaticon.com/icons/png/512/1046/1046837.png"),
  const Category(
      "Chicken", "https://image.flaticon.com/icons/png/512/3143/3143626.png"),
];

List<Promotion> promotions = <Promotion>[
  const Promotion(true, "GIVEMEFREE",
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
  const Promotion(true, "PLSDISCOUNT",
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/carbonara-pasta-facebook-post-design-template-3e059d5101c90c93dd452e87653e0d14.jpg?ts=1583940267"),
  const Promotion(true, "YUMPASTA",
      "https://madeinsingaporelah.com/wp-content/uploads/2018/10/1-for-1-Pasta.jpg"),
  const Promotion(false, "THANKYOU",
      "https://image.freepik.com/free-vector/order-now-online-delivery-you-stay-home-we-deliver-banner-design_262129-1293.jpg"),
  const Promotion(false, "ONEMOREORDER",
      "https://madeinsingaporelah.com/wp-content/uploads/2018/10/1-for-1-Pasta.jpg"),
];

String loremipsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque semper est viverra id dictum diam sed.";
