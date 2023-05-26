import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:seedisland/Hivemodel.dart';

class QuantityModel extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void increment() {
    _quantity++;
    // notifyListeners();
  }

  void decrement() {
    if (_quantity > 1) {
      _quantity--;
      // notifyListeners();
    }
  }

  String? _selectedCountry;
  List<String> _countryList = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo, Democratic Republic of the',
    'Congo, Republic of the',
    'Costa Rica',
    'Cote d\'Ivoire',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor (Timor-Leste)',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, North',
    'Korea, South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia (formerly Macedonia)',
    'Norway'
    // Add more country names here
  ];

  List<String> get countryList => _countryList;
  String? get selectedCountry => _selectedCountry;

  void setSelectedCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void filterCountryList(String query) {
    _countryList = query.isEmpty
        ? [
            'Country A',
            'Country B',
            'Country C',
            // Add more country names here
          ]
        : _countryList
            .where((country) =>
                country.toLowerCase().contains(query.toLowerCase()))
            .toList();
    notifyListeners();
  }

  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}

class HiveProvider with ChangeNotifier {
  ValueNotifier<List<user>> detailslist = ValueNotifier([]);
  Future<void> addtocart(user value) async {
    final modeldb = await Hive.openBox<user>('model_db');
    await modeldb.add(value);
    notifyListeners();
  }

  Future<void> getalldata() async {
    final modeldb = await Hive.openBox<user>('model_db');
    detailslist.value.clear();
    detailslist.value.addAll(modeldb.values);
    notifyListeners();
  }

  buttonclick(String name, String notes, String brand, int price, String image,
      int quantity) async {
    final users = user(
        // quantity: quantity,
        brand: brand,
        image: image,
        price: price,
        name: name,
        notes: notes);
    if (name.isEmpty || brand.isEmpty || image.isEmpty) {
      return;
    }
    addtocart(users);
    notifyListeners();
  }

  Future<void> remove(int index) async {
    final modeldb = await Hive.openBox<user>('model_db');
    await modeldb.deleteAt(index);
    getalldata();
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (final item in detailslist.value) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  bool get isEmpty => detailslist.value.isEmpty;

  List _country = [
    'United States',
    'india',
    'china',
  ];

  List get country => _country;

  void updateCountry(String value) {
    _country = value as List;
    notifyListeners();
  }
}
