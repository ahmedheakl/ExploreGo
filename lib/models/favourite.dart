import 'package:flutter/foundation.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Favourite> _items = [];
  int lastid = 0;

  List<Favourite> get items => _items;

  void add(String imagePath, String provider, double percent) {
    Favourite favourite = Favourite(
        id: lastid++,
        imagePath: imagePath,
        provider: provider,
        percent: percent);
    _items.add(favourite);
    notifyListeners();
  }

  bool exists(Favourite favourite) {
    for (Favourite fav in _items) {
      if (fav == favourite) return true;
    }
    return false;
  }

  void addFav(Favourite favourite) {
    _items.add(favourite);
    notifyListeners();
  }

  void remove(Favourite favourite) {
    _items.remove(favourite);
    notifyListeners();
  }
}

class Favourite {
  final int id;
  String provider;
  String imagePath;
  double percent;

  Favourite(
      {required this.id,
      required this.imagePath,
      required this.provider,
      required this.percent});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Favourite && other.id == id;

  String getPercent() {
    return "up to $percent%";
  }
}
