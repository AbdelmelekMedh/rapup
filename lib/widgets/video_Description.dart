import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.transparent.withOpacity(0.2),
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.height -655,
          padding: EdgeInsets.only(left: 5,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('@PickleRick', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('A live performance in the park withe Alix, if you werent there check out the video for a ...'),
              Row(
                children: [
                  Icon(Icons.music_note, size: 15.0, color: Colors.white),
                  Text('Say So - Doja Cat',style: TextStyle(fontSize: 12.0))
                ],
              ),
      ],
    ),
        );
  }
}
