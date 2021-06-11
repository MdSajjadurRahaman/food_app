class Menu {
  const Menu(this.name, this.price, this.url);
  final String name;
  final String price;
  final String url;
}

List<Menu> menus = <Menu>[
  const Menu('Special Cheesy Pizza', "20",
      "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg&h=960&w=640"),
  const Menu('Hot Cheesy Pizza', "15",
      "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg&h=960&w=640"),
  const Menu('Meatlover Pizza', "15",
      "https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?cs=srgb&dl=pexels-edward-eyer-1049626.jpg&fm=jpg&h=960&w=640"),
  const Menu('Uncle Special', "15",
      "https://images.pexels.com/photos/2762939/pexels-photo-2762939.jpeg?cs=srgb&dl=pexels-ana-madeleine-uribe-2762939.jpg&fm=jpg&h=960&w=640"),
  const Menu('Beef paperoni pizza', "15",
      "https://images.pexels.com/photos/4394612/pexels-photo-4394612.jpeg?cs=srgb&dl=pexels-natasha-filippovskaya-4394612.jpg&fm=jpg&h=960&w=640"),
  const Menu('Hawaian Pizza', "15",
      "https://images.pexels.com/photos/4109077/pexels-photo-4109077.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-4109077.jpg&fm=jpg&h=960&w=640"),
  const Menu('Chef Specials', "15",
      "https://images.pexels.com/photos/4193881/pexels-photo-4193881.jpeg?cs=srgb&dl=pexels-ponyo-sakana-4193881.jpg&fm=jpg&h=960&w=640"),
  const Menu('Pasta la vista', "15",
      "https://images.pexels.com/photos/6287548/pexels-photo-6287548.jpeg?cs=srgb&dl=pexels-klaus-nielsen-6287548.jpg&fm=jpg&h=960&w=640"),
  const Menu('Carbonara Pasta', "15",
      "https://images.pexels.com/photos/1256875/pexels-photo-1256875.jpeg?cs=srgb&dl=pexels-lgh-1256875.jpg&fm=jpg&h=960&w=640"),
  const Menu('Bolognise Pasta', "15",
      "https://images.pexels.com/photos/5419336/pexels-photo-5419336.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-5419336.jpg&fm=jpg&h=960&w=640"),
  const Menu('Aglio Olio Pasta', "15",
      "https://images.pexels.com/photos/5507643/pexels-photo-5507643.jpeg?cs=srgb&dl=pexels-jess-vide-5507643.jpg&fm=jpg&h=960&w=640"),
  const Menu('Lasagne', "15",
      "https://images.pexels.com/photos/5949890/pexels-photo-5949890.jpeg?cs=srgb&dl=pexels-alleksana-5949890.jpg&fm=jpg&h=960&w=640"),
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
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
  const Promotion(true, "YUMPIZZA",
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
  const Promotion(false, "THANKYOU",
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
  const Promotion(false, "ONEMOREORDER",
      "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
];
