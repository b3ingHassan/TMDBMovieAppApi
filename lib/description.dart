import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posturl, vote, launchon;

  const Description(
      {Key? key,
      this.name,
      this.description,
      this.bannerurl,
      this.posturl,
      this.vote,
      this.launchon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: KText(text: 'Average rating -' + vote!),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(10.0),
              child: KText(
                text: name != null ? name : 'Not Loaded',
                size: 24.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: KText(
                text: 'Releasing on' + launchon.toString(),
                size: 14.0,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posturl!),
                ),
                Flexible(
                  child: Container(
                    child: KText(
                      text: description,
                      size: 18.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
