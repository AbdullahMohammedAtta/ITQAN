import 'package:flutter/material.dart';
import 'package:itqan/Widgets/my_divider.dart';

class DefaultSearchBody extends StatelessWidget {
  const DefaultSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(child: Text('What do you want to search about ?')),
          MyDivider(),
          Text('All Products'),
          MyDivider(),
          ExpansionTile(
              title: Text('Products'),
            textColor: Colors.orange,
            children: [
              ExpansionTile(
                title: Text('Sneakers'),
                children: [
                  ListTile(
                    title: Text('Male'),
                  ),
                  ListTile(
                    title: Text('FeMale'),
                  ),
                  ListTile(
                    title: Text('unisex'),
                  ),
                  ListTile(
                    title: Text('Kids'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('show'),
                children: [
                  ListTile(
                    title: Text('Male'),
                  ),
                ],
              ),
              ListTile(
                title: Text('Shoe Care'),
              ),
              ListTile(
                title: Text('Socks'),
              ),
              ListTile(
                title: Text('Bags'),
              ),
            ],
          ),
          MyDivider(),
          ExpansionTile(
              title: Text('Brands'),
             textColor: Colors.orange,
            children: [
              ListTile(
                title: Text('nike'),
              ),
              ListTile(
                title: Text('Adidas'),
              ),
              ListTile(
                title: Text('NewBalance'),
              ),
              ListTile(
                title: Text('Zara'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
