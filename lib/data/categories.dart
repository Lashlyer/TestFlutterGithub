import 'package:flutter/material.dart';

import 'package:shopping_list/models/category.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};

enum LeezenColor {
  primary001,
  primary002,
  accent001,
  accent001alpha20,
  greyplaceholder,
  bg002,
  bg003,
  bg004,
  grey003,
  grey003alpha20,
  grey003alpha50,
  lightGreyGrenen,
  offWhite,
  lightSkyBlue,
  paleGrey,
  greyTextSubTitle,
  greyTextBread,
  charcoal_15
}

extension LeezenColorExtension on LeezenColor {
  Color getTypeColor() {
    switch (this) {
      case LeezenColor.primary001:
        return const Color.fromRGBO(94, 133, 46, 1);
      case LeezenColor.primary002:
        return const Color.fromRGBO(121, 171, 60, 1);
      case LeezenColor.accent001:
        return const Color.fromRGBO(251, 121, 86, 1);
      case LeezenColor.greyplaceholder:
        return const Color.fromRGBO(142, 142, 143, 1);
      case LeezenColor.bg002:
        return const Color.fromRGBO(244, 248, 239, 0.5);
      case LeezenColor.bg003:
        return const Color.fromRGBO(144, 144, 144, 0.2);
      case LeezenColor.bg004:
        return const Color.fromRGBO(228, 238, 216, 1);
      case LeezenColor.grey003:
        return const Color.fromRGBO(144, 144, 144, 1);
      case LeezenColor.grey003alpha20:
        return const Color.fromRGBO(144, 144, 144, 0.2);
      case LeezenColor.grey003alpha50:
        return const Color.fromRGBO(144, 144, 144, 0.5);
      case LeezenColor.lightGreyGrenen:
        return const Color.fromRGBO(199, 228, 163, 1);
      case LeezenColor.offWhite:
        return const Color.fromRGBO(237, 243, 229, 1);
      case LeezenColor.lightSkyBlue:
        return const Color.fromRGBO(205, 231, 255, 1);
      case LeezenColor.paleGrey:
        return const Color.fromRGBO(238, 247, 255, 1);
      case LeezenColor.greyTextSubTitle:
        return const Color.fromRGBO(116, 116, 124, 1);
      case LeezenColor.greyTextBread:
        return const Color.fromRGBO(144, 144, 150, 1);
      case LeezenColor.charcoal_15:
        return const Color.fromRGBO(47, 51, 43, 0.15);
      case LeezenColor.accent001alpha20:
        return const Color.fromRGBO(251, 121, 86, 0.2);
    }
  }
}

const leezenColor = {
  LeezenColor.primary001: Leezen(Color.fromRGBO(94, 133, 46, 1)),
  LeezenColor.primary002: Leezen(Color.fromRGBO(121, 171, 60, 1)),
  LeezenColor.accent001: Leezen(Color.fromRGBO(251, 121, 86, 1)),
  LeezenColor.greyplaceholder: Leezen(Color.fromRGBO(142, 142, 143, 1)),
  LeezenColor.bg003: Leezen(Color.fromRGBO(144, 144, 144, 0.2))
};

class Leezen {
  const Leezen(this.color);
  final Color color;
}

enum LeezenDecoration { normal }

extension LeezenDecorationExtention on LeezenDecoration {
  BoxDecoration customDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: LeezenColor.charcoal_15.getTypeColor(),
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, 2))
    ]);
  }

  BoxDecoration topShadowDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: LeezenColor.charcoal_15.getTypeColor(),
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, -2))
    ]);
  }
}
