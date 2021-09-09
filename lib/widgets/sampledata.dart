import 'dart:math';

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
  Menu(this.id, this.name, this.price, this.url, this.category, this.isActive);
  String id;
  String name;
  double price;
  String url;
  String category;
  bool isActive;
}

class Promotion {
  Promotion(this.id, this.name, this.status, this.promoCode, this.url,
      this.isPercentage, this.amount);
  String id;
  String name;
  bool status;
  String promoCode;
  String url;
  double amount;
  bool isPercentage;
}

class Profile {
  const Profile(this.user, this.email, this.phone, this.location, this.pwd);
  final user;
  final email;
  final phone;
  final location;
  final pwd;
}

class Restaurant {
  Restaurant(this.name, this.url, this.location, this.color,
      this.paymentGateway, this.driver, this.tax);
  String name;
  String url;
  String location;
  String color;
  String paymentGateway;
  String driver;
  double tax;
  dynamic key1;
  dynamic key2;
}

class Driver {
  const Driver(this.name, this.email, this.phone, this.pwd);
  final name;
  final email;
  final phone;
  final pwd;
}

class Order {
  Order(
      this.orderId,
      this.customerEmail,
      this.status,
      this.cart,
      this.via,
      this.location,
      this.time,
      this.paymentMethod,
      this.deliveryfee,
      this.tax,
      this.total,
      {this.driverId = ""});
  String orderId;
  String customerEmail;
  int status;
  List<Cart> cart;
  int via;
  String location;
  DateTime time;
  int paymentMethod;
  double deliveryfee;
  double tax;
  double total;
  String driverId;
}

class Review {
  Review(this.orderId, this.rating, this.review);
  String orderId;
  double rating;
  String review;
}

class Delivery {
  Delivery(this.custEmail, this.driverEmail, this.orderId);
  String custEmail;
  String driverEmail;
  String orderId;
}

class DeliveryOption {
  DeliveryOption(this.name, this.url, this.isActive);
  String name;
  String url;
  bool isActive;
}

class PaymentGatewayOption {
  PaymentGatewayOption(this.name, this.url, this.isActive);
  String name;
  String url;
  bool isActive;
}

List<Delivery> delivery = <Delivery>[];
List<Review> review = <Review>[];
List<Cart> cart = <Cart>[];
List<Order> order = <Order>[];

List<PaymentGatewayOption> paymentGatewayOption = <PaymentGatewayOption>[
  PaymentGatewayOption("testing",
      "https://image.flaticon.com/icons/png/512/1813/1813870.png", false),
  PaymentGatewayOption(
      "Stripe",
      "https://upload.wikimedia.org/wikipedia/en/e/eb/Stripe_logo%2C_revised_2016.png",
      false),
  PaymentGatewayOption(
      "BillPlz",
      "https://cdn00.billplz.com/assets/v1/Billplz_onblue-7c86b5314957c1dbd8ecc5cda63b90b8a42b1aead36a79b5c89806c4571b30a2.png",
      false),
];

List<DeliveryOption> deliveryOption = <DeliveryOption>[
  DeliveryOption("disabled",
      "https://image.flaticon.com/icons/png/512/109/109174.png", false),
  DeliveryOption("internal",
      "https://image.flaticon.com/icons/png/512/3027/3027212.png", false),
  DeliveryOption(
      "lalamove",
      "https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Lalamove_Logo.png/220px-Lalamove_Logo.png",
      false),
];

List<Profile> profiles = <Profile>[
  const Profile("John Doe", "joe.doe@gmail.com", "+601119996665",
      "Kuala Lumpur", "123123"),
];

List<Restaurant> restaurant = <Restaurant>[
  Restaurant("Pizza Restaurant", "", "Bangsar, Kuala Lumpur", "Red", "Stripe",
      "internal", 6),
];

List<Driver> driver = <Driver>[
  const Driver("driver1", "driver1@gmail.com", "+443242424", "123123"),
  const Driver("driver2", "driver2@gmail.com", "+1424353253", "123123"),
  const Driver("driver3", "driver3@gmail.com", "+23523522", "123123"),
  const Driver("driver4", "driver4@gmail.com", "+43242352", "123123"),
  const Driver("driver5", "driver5@gmail.com", "+3242352352", "123123"),
  const Driver("driver6", "driver6@gmail.com", "+25232352", "123123"),
];

List<Menu> menus = <Menu>[
  Menu(
      '928819991',
      'Special Cheesy',
      20,
      "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '33333333',
      'Hot Cheesy',
      15,
      "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '928819994241',
      'Meatlover',
      15,
      "https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?cs=srgb&dl=pexels-edward-eyer-1049626.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '253525222',
      'Uncle Special',
      15,
      "https://images.pexels.com/photos/2762939/pexels-photo-2762939.jpeg?cs=srgb&dl=pexels-ana-madeleine-uribe-2762939.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '888676464',
      'Beef paperoni',
      25,
      "https://images.pexels.com/photos/4394612/pexels-photo-4394612.jpeg?cs=srgb&dl=pexels-natasha-filippovskaya-4394612.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '4252353',
      'Hawaian',
      35,
      "https://images.pexels.com/photos/4109077/pexels-photo-4109077.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-4109077.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '52325666',
      'Chef Specials',
      13,
      "https://images.pexels.com/photos/4193881/pexels-photo-4193881.jpeg?cs=srgb&dl=pexels-ponyo-sakana-4193881.jpg&fm=jpg&h=960&w=640",
      "Pizza",
      true),
  Menu(
      '534536363',
      'Pasta la vista',
      20,
      "https://images.pexels.com/photos/6287548/pexels-photo-6287548.jpeg?cs=srgb&dl=pexels-klaus-nielsen-6287548.jpg&fm=jpg&h=960&w=640",
      "Pasta",
      true),
  Menu(
      '76868686',
      'Carbonara Pasta',
      23,
      "https://images.pexels.com/photos/1256875/pexels-photo-1256875.jpeg?cs=srgb&dl=pexels-lgh-1256875.jpg&fm=jpg&h=960&w=640",
      "Pasta",
      true),
  Menu(
      '2342626262',
      'Bolognise Pasta',
      14,
      "https://images.pexels.com/photos/5419336/pexels-photo-5419336.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-5419336.jpg&fm=jpg&h=960&w=640",
      "Pasta",
      true),
  Menu(
      '62626222',
      'Aglio Olio Pasta',
      33,
      "https://images.pexels.com/photos/5507643/pexels-photo-5507643.jpeg?cs=srgb&dl=pexels-jess-vide-5507643.jpg&fm=jpg&h=960&w=640",
      "Pasta",
      true),
  Menu(
      '765757555',
      'Lasagne',
      22,
      "https://images.pexels.com/photos/5949890/pexels-photo-5949890.jpeg?cs=srgb&dl=pexels-alleksana-5949890.jpg&fm=jpg&h=960&w=640",
      "Sides",
      true),
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
  Promotion(
      "PROMO1",
      "10% DISC",
      true,
      "GIVEMEFREE",
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg",
      true,
      10),
  Promotion(
      "PROMO2",
      "FREE RM15",
      true,
      "PLSDISCOUNT",
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/carbonara-pasta-facebook-post-design-template-3e059d5101c90c93dd452e87653e0d14.jpg?ts=1583940267",
      false,
      15),
  Promotion(
      "PROMO3",
      "20-20 DAY!",
      true,
      "GIVEMEDISCOUNT",
      "https://madeinsingaporelah.com/wp-content/uploads/2018/10/1-for-1-Pasta.jpg",
      true,
      20),
  Promotion(
      "PROMO4",
      "STAY HOME SAVE",
      false,
      "ISTAYHOME",
      "https://image.freepik.com/free-vector/order-now-online-delivery-you-stay-home-we-deliver-banner-design_262129-1293.jpg",
      false,
      10),
  Promotion(
      "PROMO5",
      "RM5 DISCOUNT",
      false,
      "ONEMOREORDER",
      "https://madeinsingaporelah.com/wp-content/uploads/2018/10/1-for-1-Pasta.jpg",
      false,
      5),
];

String loremipsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque semper est viverra id dictum diam sed.";
