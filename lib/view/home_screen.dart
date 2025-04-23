import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/home_view_model.dart';
import 'package:provider_state/view_model/user_preferences_view_model.dart';

import '../data/response/status.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel homeViewModel = HomeViewModel();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMovies(); // fetch all and paginate manually

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        homeViewModel.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final userPreferences = Provider.of<UserPreferencesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.removeUser().then((value) {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Logout', style: TextStyle(color: Colors.black)),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider<HomeViewModel>.value(
        value: homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child: Text(value.movieList.message.toString(),
                        style: TextStyle(color: Colors.white)));
              case Status.COMPLETED:
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: value.movies.length + 1, // +1 for loader
                  itemBuilder: (context, index) {
                    if (index < value.movies.length) {
                      final movie = value.movies[index];
                      return Card(
                        color: Colors.green,
                        child: ListTile(
                          leading: Image.network(
                            movie.posterurl ?? '',
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.error, color: Colors.red),
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(movie.title!),
                          subtitle: Text(movie.storyline!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.setAverageRating(movie.ratings!)
                                  .toString()),
                              Icon(Icons.star, color: Colors.yellowAccent),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return value.isFetchingMore
                          ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : SizedBox.shrink();
                    }
                  },
                );
              default:
                return Text('Unknown state', style: TextStyle(color: Colors.white));
            }
          },
        ),
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


