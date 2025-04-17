
import 'package:flutter/material.dart';

//stateless widget using as stateful widget

class NotifyListenerScreen extends StatelessWidget {
   NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('StateLess'),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context,value,child){
             return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);

            }),
      )
        ,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: (){
            _counter.value++;
            print(_counter.value.toString());
      },
       child: Icon(Icons.add),
      
      ),
    );
  }
}

