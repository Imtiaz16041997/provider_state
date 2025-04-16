import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/container_provider.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContainerProvider>(context, listen: false);
    print('build 1');
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiProvider"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ContainerProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.value,
                min: 0,
                max: 1,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<ContainerProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
