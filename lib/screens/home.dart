import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:youtube_ui/models/dataset_model.dart';
import 'package:youtube_ui/widgets/video.dart';

import '../services/read_json.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<IconData> actionsIcons = [
    Icons.cast_sharp,
    Icons.notifications_on_outlined,
    Icons.search,
    Icons.account_circle
  ];
  List<String> categories = [
    "All",
    "Music",
    "Baking",
    "Movies",
    "History",
    "Comedy",
    "Bollywood"
  ];

  String selectedCategory = "All";
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: ScrollAppBar(
            controller: controller,
            title: Image.asset(
              "assets/images/logo.png",
              height: 20,
              fit: BoxFit.contain,
            ),
            actions: actionsIcons
                .map((iconName) =>
                    IconButton(onPressed: () {}, icon: Icon(iconName)))
                .toList(),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.explore_outlined, color: Colors.black),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "Explore",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade200),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      children: categories
                          .map((category) => FilterChip(
                              showCheckmark: false,
                              label: Text(
                                category,
                                style: TextStyle(
                                    color: selectedCategory == category
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              selectedColor: Colors.grey.shade600,
                              selected: selectedCategory == category,
                              onSelected: (bool value) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              }))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: FutureBuilder<List<DatasetModel>>(
              future: ReadJsonData(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data;
                  return ListView.builder(
                      controller: controller,
                      itemCount: items!.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Video(
                          coverPicture: item.coverPicture.toString(),
                          title: item.title.toString(),
                          videoUrl: item.videoUrl.toString(),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
