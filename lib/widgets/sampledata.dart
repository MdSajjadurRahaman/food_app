class Category {
  const Category(this.category, this.iconUrl);
  final String category;
  final String iconUrl;
}

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

class Menu {
  const Menu(this.name, this.price, this.url, this.category);
  final String name;
  final String price;
  final String url;
  final String category;
}

class Profile {
  const Profile(this.user, this.email, this.phone, this.location);
  final user;
  final email;
  final phone;
  final location;
}

List<Profile> profiles = <Profile>[
  const Profile(
      "Ikhwa Joe Doe", "joe.doe@gmail.com", "+601119996665", "Kuala Lumpur"),
];

List<Menu> menus = <Menu>[
  const Menu(
      'Special Cheesy',
      "20",
      "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Hot Cheesy',
      "15",
      "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Meatlover',
      "15",
      "https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?cs=srgb&dl=pexels-edward-eyer-1049626.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Uncle Special',
      "15",
      "https://images.pexels.com/photos/2762939/pexels-photo-2762939.jpeg?cs=srgb&dl=pexels-ana-madeleine-uribe-2762939.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Beef paperoni',
      "15",
      "https://images.pexels.com/photos/4394612/pexels-photo-4394612.jpeg?cs=srgb&dl=pexels-natasha-filippovskaya-4394612.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Hawaian',
      "15",
      "https://images.pexels.com/photos/4109077/pexels-photo-4109077.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-4109077.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Chef Specials',
      "15",
      "https://images.pexels.com/photos/4193881/pexels-photo-4193881.jpeg?cs=srgb&dl=pexels-ponyo-sakana-4193881.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Pasta la vista',
      "15",
      "https://images.pexels.com/photos/6287548/pexels-photo-6287548.jpeg?cs=srgb&dl=pexels-klaus-nielsen-6287548.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Carbonara Pasta',
      "15",
      "https://images.pexels.com/photos/1256875/pexels-photo-1256875.jpeg?cs=srgb&dl=pexels-lgh-1256875.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Bolognise Pasta',
      "15",
      "https://images.pexels.com/photos/5419336/pexels-photo-5419336.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-5419336.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Aglio Olio Pasta',
      "15",
      "https://images.pexels.com/photos/5507643/pexels-photo-5507643.jpeg?cs=srgb&dl=pexels-jess-vide-5507643.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
  const Menu(
      'Lasagne',
      "15",
      "https://images.pexels.com/photos/5949890/pexels-photo-5949890.jpeg?cs=srgb&dl=pexels-alleksana-5949890.jpg&fm=jpg&h=960&w=640",
      "Pizza"),
];

class Promotion {
  const Promotion(this.status, this.promoCode, this.url);
  final bool status;
  final String promoCode;
  final String url;
}

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