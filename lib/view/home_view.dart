import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 2), (timer){
      counterProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final counterProvider = Provider.of<CountProvider>(context,listen: false);

    return Scaffold(
      appBar:  AppBar(
        title: Text('Subscribe'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print('build inside consumer');
          return Text(value.count.toString(), style: TextStyle(fontSize: 50),);
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterProvider.setCount();
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
