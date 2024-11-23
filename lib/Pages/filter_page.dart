import 'package:flutter/material.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';
import 'package:itqan/shared/Icon/icon_broken.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter With'),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(IconBroken.Arrow___Left_2)),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    color: defaultColor.shade50,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(IconBroken.Plus),
                        Spacer(),
                        Text('Color'),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: 15,
          ),
        ),
      ),
    );
  }
}
