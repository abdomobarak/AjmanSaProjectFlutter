import 'package:ajman_app/src/models/offers_json_model.dart';
import 'package:ajman_app/src/ui/widgets/offer_details_body.dart';
import 'package:flutter/material.dart';


class OfferDetailsScreen extends StatelessWidget {
  final Offers offersList;
  const OfferDetailsScreen({Key key, this.offersList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OfferDetailsBody(context,offersList),
      ),
    );
  }
}
