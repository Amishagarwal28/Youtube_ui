import 'package:flutter/material.dart';
import '/screens/home.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Builder(
        builder: (context) => const Scaffold(
          bottomNavigationBar: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 10),
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(height: 60, icon: Icon(Icons.home), text: "Home"),
              Tab(
                  height: 60,
                  icon: Icon(Icons.play_arrow_outlined),
                  text: "Shorts"),
              Tab(
                height: 60,
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 35,
                ),
              ),
              Tab(
                  height: 60,
                  icon: Icon(Icons.subscriptions_outlined),
                  text: "Subscriptions"),
              Tab(
                  height: 60,
                  icon: Icon(Icons.video_library_outlined),
                  text: "Library")
            ],
          ),
          body: Home(),
        ),
      ),
    );
  }
}
