import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/home_view_model.dart';
import 'package:provider_state/view_model/user_preferences_view_model.dart';

import '../components/navigation_menu.dart';
import '../data/response/status.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }

  List<Widget> _screens = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screens = [
      ChangeNotifierProvider<HomeViewModel>.value(
        value: homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.movieList.data?.movies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final movie = value.movieList.data!.movies![index];
                      return Card(
                        color: Colors.green,
                        child: ListTile(
                          leading: Image.network(
                            movie.posterurl ?? '',
                            errorBuilder: (context, error, stack) => Icon(Icons.error, color: Colors.red),
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(movie.title ?? ""),
                          subtitle: Text(movie.storyline ?? ""),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.setAverageRating(movie.ratings!).toString()),
                              Icon(Icons.star, color: Colors.yellowAccent),
                            ],
                          ),
                        ),
                      );
                    });
              case Status.ERROR:
                return Center(child: Text(value.movieList.message ?? '', style: TextStyle(color: Colors.white)));
              default:
                return Text('Unknown state');
            }
          },
        ),
      ),
      ProfileScreen(),
      StoreScreen(),
      MoreScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(child: Text('Logout')),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}

