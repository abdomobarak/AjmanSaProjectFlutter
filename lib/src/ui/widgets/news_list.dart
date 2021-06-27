
import 'package:ajman_app/src/providers/news_provider.dart';
import 'package:ajman_app/src/ui/widgets/news_details.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




Widget buildNewsList( BuildContext context) {
var newsProvider = Provider.of<NewsProvider>(context);

  return AnimationLimiter(
    child: AnimationConfiguration.synchronized(
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        verticalOffset: 100.0,
        child: FadeInAnimation(
          child: ListView.builder(
            shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             padding: EdgeInsets.all(5),
             itemCount: newsProvider.reversedNewsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [


                    ListTile(
                      onTap: () =>
                       Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => NewsDetails(
                           index:index
                         ),)
                       ),

                      title: FadeInImage.assetNetwork(
                        image: 'https://ajmansa.com/' + '${newsProvider.reversedNewsList[index].newsimage}',
                        placeholder:'images/spinner.gif',
                        fit: BoxFit.fill,
                      ),


                        subtitle: Column(
                          children: [
                            Text(
                              newsProvider.reversedNewsList[index].newstitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.amiri(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                //backgroundColor: Colors.blue
                              ),
                            ),

                            Text(
                              newsProvider.reversedNewsList[index].newsdescription,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.amiri(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                //backgroundColor: Colors.blue
                              ),
                            ),
                          ],
                        )

                    ),


                    Divider(),



                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: ExpandablePanel(
                    //     header: Text(
                    //       newsProvider.reversedNewsList[index].newstitle,
                    //       style: GoogleFonts.amiri(
                    //           fontSize: 20.0,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.bold,
                    //          //backgroundColor: Colors.blue
                    //       ),
                    //     ),
                    //     collapsed: Text(
                    //       newsProvider.reversedNewsList[index].newsdescription,
                    //       style: GoogleFonts.amiri(
                    //         fontSize: 18.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       softWrap: true,
                    //       maxLines: 2,
                    //       overflow: TextOverflow.ellipsis,),
                    //
                    //     expanded: Text(
                    //       newsProvider.reversedNewsList[index].newsdescription,
                    //       style: GoogleFonts.amiri(
                    //         fontSize: 18.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       softWrap: true, ),
                    //   ),
                    // )
                  ],
                );
              },
          ),
        ),
      ),
    ),
  );

}