import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, String pageHttp) async =>
    await canLaunch(pageHttp)
        ? await launch(pageHttp)
        : throw 'Could not launch $pageHttp';
