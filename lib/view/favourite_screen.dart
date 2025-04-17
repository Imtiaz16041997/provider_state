import 'package:flutter/material.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
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
                return ListTile(
                  onTap: (){
                  selectedItem.add(index);
                  setState(() {

                  });
                  },
                  title: Text('Item '+index.toString()),
                  trailing: (selectedItem.contains(index) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
                );
                }),
          )
        ],
      ),
    );
  }
}
