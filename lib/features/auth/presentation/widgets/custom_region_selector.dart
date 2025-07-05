import 'package:flutter/material.dart';

class CustomRegionSelector extends StatefulWidget {
  final void Function(String?, String?)? onChanged;
  const CustomRegionSelector({super.key, this.onChanged});

  @override
  State<CustomRegionSelector> createState() => _CustomRegionSelectorState();
}

class _CustomRegionSelectorState extends State<CustomRegionSelector> {
  final Map<String, List<String>> regionDistricts = {
    'Andijon': [
      'Andijon shahri',
      'Asaka',
      'Baliqchi',
      'Boʻston',
      'Buloqboshi',
      'Izboskan',
      'Jalaquduq',
      'Qoʻrgʻontepa',
      'Marhamat',
      'Oltinkoʻl',
      'Paxtaobod',
      'Shahrixon',
      'Ulugʻnor',
      'Xoʻjaobod'
    ],
    'Buxoro': [
      'Buxoro shahri',
      'Buxoro',
      'Gʻijduvon',
      'Jondor',
      'Kogon',
      'Olot',
      'Peshku',
      'Qorakoʻl',
      'Qorovulbozor',
      'Romitan',
      'Shofirkon',
      'Vobkent'
    ],
    'Fargʻona': [
      'Fargʻona shahri',
      'Bagʻdod',
      'Beshariq',
      'Buvayda',
      'Dangʻara',
      'Furqat',
      'Oltiariq',
      'Qoʻshtepa',
      'Quva',
      'Rishton',
      'Soʻx',
      'Toshloq',
      'Uchkoʻprik',
      'Uzbekistan',
      'Yozyovon'
    ],
    'Jizzax': [
      'Jizzax shahri',
      'Arnasoy',
      'Baxmal',
      'Dostlik',
      'Forish',
      'Gʻallaorol',
      'Mirzachoʻl',
      'Paxtakor',
      'Yangiobod',
      'Zafarobod',
      'Zarbdor',
      'Zomin',
      'Sharof Rashidov'
    ],
    'Namangan': [
      'Namangan shahri',
      'Chortoq',
      'Chust',
      'Kosonsoy',
      'Mingbuloq',
      'Norin',
      'Pop',
      'Toʻraqoʻrgʻon',
      'Uchqoʻrgʻon',
      'Uychi',
      'Yangiqoʻrgʻon'
    ],
    'Navoiy': [
      'Navoiy shahri',
      'Karmana',
      'Konimex',
      'Navbahor',
      'Nurota',
      'Xatirchi',
      'Qiziltepa',
      'Tomdi',
      'Uchquduq'
    ],
    'Qashqadaryo': [
      'Qarshi shahri',
      'Chiroqchi',
      'Dehqonobod',
      'Gʻuzor',
      'Kasbi',
      'Kitob',
      'Koson',
      'Mirishkor',
      'Muborak',
      'Nishon',
      'Qamashi',
      'Shahrisabz',
      'Yakkabogʻ'
    ],
    'Samarqand': [
      'Samarqand shahri',
      'Bulungʻur',
      'Ishtixon',
      'Jomboy',
      'Kattaqoʻrgʻon',
      'Narpay',
      'Nurobod',
      'Oqdaryo',
      'Paxtachi',
      'Payariq',
      'Pastdargʻom',
      'Tayloq',
      'Urgut'
    ],
    'Sirdaryo': [
      'Guliston shahri',
      'Boyovut',
      'Guliston',
      'Mirzaobod',
      'Oqoltin',
      'Sardoba',
      'Sayxunobod',
      'Sirdaryo',
      'Xovos',
      'Yangiyer',
      'Shirin'
    ],
    'Surxondaryo': [
      'Termiz shahri',
      'Angor',
      'Bandixon',
      'Boysun',
      'Denov',
      'Jarqoʻrgʻon',
      'Muzrabot',
      'Oltinsoy',
      'Qiziriq',
      'Qumqoʻrgʻon',
      'Sariosiyo',
      'Sherobod',
      'Shoʻrchi',
      'Uzun'
    ],
    'Toshkent viloyati': [
      'Nurafshon shahri',
      'Bekobod',
      'Boʻka',
      'Boʻstonliq',
      'Chinoz',
      'Ohangaron',
      'Oqqoʻrgʻon',
      'Parkent',
      'Piskent',
      'Quyi Chirchiq',
      'Yangiyoʻl',
      'Yuqori Chirchiq',
      'Zangiota',
      'Toshkent tumani',
      'Qibray'
    ],
    'Xorazm': [
      'Urganch shahri',
      'Bogʻot',
      'Gurlan',
      'Hazorasp',
      'Xiva',
      'Qoʻshkoʻpir',
      'Shovot',
      'Urganch',
      'Xonqa',
      'Yangiariq',
      'Yangibozor'
    ],
    'Qoraqalpogʻiston': [
      'Nukus shahri',
      'Amudaryo',
      'Beruniy',
      'Chimboy',
      'Ellikqalʼa',
      'Kegeyli',
      'Moʻynoq',
      'Nukus',
      'Qoʻngʻirot',
      'Qanlikoʻl',
      'Shumanay',
      'Taxtakoʻpir',
      'Toʻrtkoʻl',
      'Xoʻjayli'
    ],
    'Toshkent shahri': [
      'Bektemir',
      'Chilonzor',
      'Hamza (Yashnobod)',
      'Mirobod',
      'Mirzo Ulugʻbek',
      'Olmazor',
      'Sergeli',
      'Shayxontohur',
      'Uchtepa',
      'Yakkasaroy',
      'Yangihayot',
      'Yunusobod'
    ],
  };

  String? selectedRegion;
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    List<String> districts =
        selectedRegion != null ? regionDistricts[selectedRegion] ?? [] : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedRegion,
              hint: const Text("Viloyat"),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF1831B2),
              ),
              onChanged: (value) {
                setState(() {
                  selectedRegion = value;
                  selectedDistrict = null;
                });
                widget.onChanged?.call(selectedRegion, null);
              },
              items: regionDistricts.keys.map((region) {
                return DropdownMenuItem(
                  value: region,
                  child: Text(
                    region,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: selectedRegion == null ? Colors.grey.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedDistrict,
              hint: const Text("Tuman"),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF1831B2),
              ),
              onChanged: selectedRegion == null
                  ? null
                  : (value) {
                setState(() {
                  selectedDistrict = value;
                });
                widget.onChanged?.call(selectedRegion, selectedDistrict);
              },
              items: districts.map((district) {
                return DropdownMenuItem(
                  value: district,
                  child: Text(
                    district,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
