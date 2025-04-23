import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/home_view_model.dart';
import 'package:provider_state/view_model/user_preferences_view_model.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }
  
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserPreferencesViewModel>(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userPreferences.removeUser().then((value){
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            },
            child: Text('Logout'),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context,value,child){
          switch(value.movieList.status){
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.movieList.data?.movies?.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: Colors.amberAccent,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              value.movieList!.data!.movies![index].posterurl.toString(),
                          ),
                        ),
                        title: Text(value.movieList!.data!.movies![index].title.toString()),
                        subtitle: Text(value.movieList!.data!.movies![index].storyline.toString()),
                      
                      ),
                    );
                  }
              );
            case Status.ERROR:
            return Text(value.movieList.message.toString());

            default:
              return Text('Unknown state');
          }
        }),
      ),
    );
  }
}


      /*SafeArea(
        child: Column(
          children: [
              InkWell(
                onTap: (){
                  userPreferences.removeUser().then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                },
                child: Text('Logout'),
              )
          ],
        ),
      ),*/


