import 'package:flutter/material.dart';
import 'package:themovedb/widgets/common/common_widgets.dart';
import 'package:themovedb/widgets/movie_list_widget/movie_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  int  _selectedTab = 1;
  void _onSelecedTab (int index){
    if(_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }
  static const List<Widget> _widgets = [
    Text('news'),
    MovieListWidget(),
    Text('TV shows'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(context),
      body: Center(child:_widgets[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Shows'
            ),        
          ],
        onTap: _onSelecedTab,
        ),
    );
  }
}