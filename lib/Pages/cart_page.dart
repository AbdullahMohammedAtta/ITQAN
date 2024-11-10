import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/shared/Functions/functions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/Images/CartEmpty.png',height: MediaQuery.of(context).size.height*0.2,),
          const SizedBox(height: 10),
          const Text('   Your cart is empty now\nThank you for choosing us!',style: TextStyle(fontSize: 16),),
          const SizedBox(height: 15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: MaterialButton(
              onPressed: (){},
               color: Colors.orange,
              child: const Text(
                  'Shop Now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
