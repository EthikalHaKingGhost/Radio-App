// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radio_app_v2/screens/screens.dart';
import 'package:radio_app_v2/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'radio_app_v2',
              child: Image.asset("assets/cropcover.jpg"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.radio_outlined),
              label: const Text("Listen Radio"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RadioPlayer(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.white,
                fixedSize: const Size(250, 60),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                elevation: 15,
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                shape: const StadiumBorder(),
              ),
              //child: const Text("Listen Radio"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule_outlined),
              label: const Text("View Schedule"),
              onPressed: () async {
                if (!await launchUrl(scheduleUrl)) {
                  throw 'Could not launch $scheduleUrl';
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.white,
                fixedSize: const Size(250, 65),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                elevation: 15,
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                shape: const StadiumBorder(),
              ),
              //child: const Text("Listen Radio"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.menu_outlined),
              label: const Text("More Menus"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MoreMenus(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.white,
                fixedSize: const Size(250, 60),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                elevation: 15,
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                shape: const StadiumBorder(),
              ),
              //child: const Text("Listen Radio"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.facebook, size: 30),
                    color: const Color(0xFF0075fc),
                    onPressed: () async {
                      if (!await launchUrl(fbUrl)) {
                        throw 'Could not launch $fbUrl';
                      }
                    }),
                const SizedBox(width: 15),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.youtube, size: 30),
                    color: const Color(0xFFFF0000),
                    onPressed: () async {
                      if (!await launchUrl(ytUrl)) {
                        throw 'Could not launch $ytUrl';
                      }
                    }),
                const SizedBox(width: 15),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram, size: 30),
                    color: const Color(0xFF001C40),
                    onPressed: () async {
                      if (!await launchUrl(iGUrl)) {
                        throw 'Could not launch $iGUrl';
                      }
                    }),
                const SizedBox(width: 15),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.globe, size: 30),
                    color: const Color(0xFF001C40),
                    onPressed: () async {
                      if (!await launchUrl(webUrl)) {
                        throw 'Could not launch $webUrl';
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
