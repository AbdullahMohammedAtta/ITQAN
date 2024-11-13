import 'package:flutter/material.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatelessWidget {
  final String image;
  const PhotoPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PhotoView(
                imageProvider: NetworkImage(image),
              enableRotation: true,
              enablePanAlways: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle,size: 45,color: CacheHelper.getBoolean(key: 'isDark')?? false ? Colors.black : Colors.white,),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(IconBroken.Arrow___Left_2,size: 30,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
