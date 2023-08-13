// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radio_app_v2/constants/constants.dart';

class MoreMenus extends StatefulWidget {
  const MoreMenus({super.key});

  @override
  State<MoreMenus> createState() => _MoreMenusState();
}

class _MoreMenusState extends State<MoreMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.white])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('More menus'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.phone_outlined),
                label: const Text("Contact Us"),
                onPressed: () async {
                  if (!await launchUrl(phoneUrl)) {
                    throw 'Could not launch $phoneUrl';
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.white,
                  fixedSize: const Size(250, 60),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  elevation: 15,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  shape: const StadiumBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.mail_outlined),
                label: const Text("Email Us"),
                onPressed: () async {
                  if (!await launchUrl(mailUrl)) {
                    throw 'Could not launch $mailUrl';
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.white,
                  fixedSize: const Size(250, 60),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  elevation: 15,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  shape: const StadiumBorder(),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                textAlign: TextAlign.center,
                "radio_app_v2 is Operated by Higher Ground Tabernacle ministries",
                style: TextStyle(
                  color: Colors.black87,
                  overflow: TextOverflow.fade,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 300,
                height: 230,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/app_logo.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
