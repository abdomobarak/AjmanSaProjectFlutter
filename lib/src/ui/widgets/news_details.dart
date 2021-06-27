import 'package:ajman_app/src/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class NewsDetails extends StatelessWidget {

    int index;
    NewsDetails({this.index});


  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                IconButton(
                    onPressed: () =>
                    Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios)
                ),


                Text(
                  newsProvider.reversedNewsList[index].newstitle,
                  style: GoogleFonts.amiri(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff0e4c53)
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width / 20,)

              ],
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height / 20
            ),

            ListTile(
              title: FadeInImage.assetNetwork(
                image: 'https://ajmansa.com/' + '${newsProvider.reversedNewsList[index].newsimage}',
                placeholder:'images/spinner.gif',
                fit: BoxFit.fill,
              ),

              subtitle:  Text(
                newsProvider.reversedNewsList[index].newsdescription,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.blue
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
