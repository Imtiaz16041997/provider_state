

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({super.key});

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {
  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context,index){
                  final item = favouriteProvider.selectedItem[index];
                  return Consumer<FavouriteProvider>(builder: (context,value,child){
                    return  ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(item)){
                          value.removeItem(item);
                        }else {
                          value.addItem(item);
                        }

                      },
                      title: Text('Item '+item.toString()),
                      trailing: (value.selectedItem.contains(item) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
