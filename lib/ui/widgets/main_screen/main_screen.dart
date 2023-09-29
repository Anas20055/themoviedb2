import 'package:flutter/material.dart';
import 'package:themovedb/ui/widgets/common/common_widgets.dart';
import 'package:themovedb/ui/widgets/movie_list_widget/movie_list_widget.dart';
import 'package:themovedb/ui/widgets/news/news_widget.dart';
import 'package:themovedb/ui/widgets/tv_show_list_widget/tv_show_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  int  _selectedTab = 0;
  void _onSelecedTab (int index){
    if(_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(context),
      body: IndexedStack(
        index: _selectedTab,
        children:const  [
          NewsWidget(),
          MovieListWidget(),
          TVShowListWidget()     
      ]
      ),
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