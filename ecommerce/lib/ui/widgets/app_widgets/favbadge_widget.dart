import 'package:badges/badges.dart';
import 'package:badges/badges.dart'as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/favourites_provider.dart';
import '../../screens/user_screens/favourites_screen.dart';
Widget buildfav_badge(){
  return  Consumer<FavouritesProvider>(
      builder: (context, favdata, child) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavouritesScreen()));
          },
          child: badges.Badge(
            child: const Icon(
              Icons.favorite,
              size: 30,
              // color: Colors.grey,
            ),
            badgeStyle: BadgeStyle(
              badgeColor: Colors.grey,
            ),
            badgeContent: Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                '${favdata.favouriteslist.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      });
}