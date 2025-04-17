import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {

    //final favouriteProvider = Provider.of<FavouriteProvider>(context);

    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded( 
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
                return Consumer<FavouriteProvider>(builder: (context,value,child){
                  return  ListTile(
                    onTap: (){
                      value.addItem(index);
                    },
                    title: Text('Item '+index.toString()),
                    trailing: (value.selectedItem.contains(index) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
                  );
                });
                }),
          )
        ],
      ),
    );
  }
}
