import 'package:flutter/material.dart';
import 'package:gallery/core/routers.dart';
import 'package:gallery/screens/pictures_favorite_screen.dart';
import 'package:gallery/screens/pictures_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  void _onTapNavigationBar(int index) {
    //_pageController.jumpToPage(index);
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _create() {
    Navigator.of(context).pushNamed(Routers.createPicture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _create, icon: Icon(Icons.add))],
      ),
      body: PageView(
        controller: _pageController,
        children: [PicturesScreen(), PicturesFavoriteScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapNavigationBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Галерея'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
        ],
      ),
    );
  }
}
