import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MusicIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent.withOpacity(0.2),
      width: MediaQuery.of(context).size.width - 293,//100
      height: MediaQuery.of(context).size.height -655,//100
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [getMusicPlayerAction()]),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
      colors: [
        Colors.grey[800],
        Colors.grey[900],
        Colors.grey[900],
        Colors.grey[800]
      ],
      stops: [0.0,0.4, 0.6,1.0],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight
  );

  Widget getMusicPlayerAction() {
    return Container(
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                gradient: musicGradient,
                borderRadius: BorderRadius.circular(50.0 / 2)
            ),
            child: CachedNetworkImage(
              imageUrl: "https://icon-library.com/images/song-icon-png/song-icon-png-13.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

        ])
    );
  }
}
