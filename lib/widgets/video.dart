import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_ui/multi_manager/flick_multi_player.dart';
import '../multi_manager/flick_multi_manager.dart';
import '../models/dataset_model.dart';

class Video extends StatefulWidget {
  const Video(
      {required this.coverPicture,
      required this.title,
      required this.videoUrl});
  final String coverPicture;
  final String title;
  final String videoUrl;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late FlickMultiManager flickMultiManager;
  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VisibilityDetector(
            key: ObjectKey(flickMultiManager),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0 && this.mounted) {
                flickMultiManager.pause();
              }
            },
            child: Container(
              height: 250,
              child: FlickMultiPlayer(
                url: widget.videoUrl,
                flickMultiManager: flickMultiManager,
                image: widget.coverPicture,
              ),
            )),
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/yellow.jpg"),
                radius: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(widget.title,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Icon(
                Icons.more_vert,
                size: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
