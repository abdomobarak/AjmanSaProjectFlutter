

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}



 makeCall(String userPhone) {
  FlutterPhoneDirectCaller
      .callNumber(userPhone);
}