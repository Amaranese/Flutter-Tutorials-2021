/*
*Mr Nguyen Duc Hoang,
* Youtube channel: https://www.youtube.com/c/nguyenduchoang
* Programming tutorial channel
 */
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
class URLImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return URLImageState();
  }
}
class URLImageState extends State<URLImage> {
  var imageURLs = [
    'https://upload.wikimedia.org/wikipedia/commons/6/6e/Lactarius_indigo_48568.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/c2/Amanita_muscaria_%28fly_agaric%29.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/f/f1/Amanita_stirps_Hemibapha_45069.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/6/65/Yellowmushrooms.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/e/e1/2014-02-26_Ganoderma_lingzhi_Sheng_H._Wu%2C_Y._Cao_%26_Y.C._Dai_574882.jpg'
  ];
  var selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final cachedImage = new CachedNetworkImage(
      placeholder: new CircularProgressIndicator(),
      imageUrl: imageURLs[selectedImageIndex],
      height: 300.0,
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load URL image in Flutter"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Center(
                  child: cachedImage,
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new RaisedButton(
                        child: new Text("Back"),
                        onPressed: (){
                          setState(() {
                            selectedImageIndex=selectedImageIndex<=0?
                                                selectedImageIndex:selectedImageIndex-1;
                          });
                        }
                    )
                ),
                new Expanded(
                    child: new RaisedButton(
                        child: new Text("Next"),
                        onPressed: (){
                          setState(() {
                            selectedImageIndex = (selectedImageIndex >= imageURLs.length - 1) ?
                                    selectedImageIndex : selectedImageIndex + 1;
                          });
                        }
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
