import 'package:flutter/material.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Row(
          children: [
            Text('WishList',),
            SizedBox(width: 5,),
            Icon(IconBroken.Document),
          ],
        ),
      ),
      body:   const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(IconBroken.Heart,size: 200,weight: 0.3,),
              ],
            ),
            Text(
                'No products in the wishlist!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
