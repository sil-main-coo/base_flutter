import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{
  static void unFocusField(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void afterBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> callPhone(String phone) async {
    String url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not call to $url.';
    }
  }

  static Future<void> sendEmail(String email) async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send email to $url.';
    }
  }

  static Future<void> sendSMS(String phone) async {
    String url = 'sms:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send SMS to $url.';
    }
  }
}