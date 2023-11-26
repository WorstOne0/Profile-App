// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:profile/widgets/flutter_tags.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.nunito().fontFamily,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 100;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: Stack(
        children: [
          ParticlesFly(
            height: height,
            width: width,
            connectDots: true,
            awayRadius: 40,
            numberOfParticles: 40,
            speedOfParticles: 0.5,
            onTapAnimation: false,
            isRandSize: true,
            maxParticleSize: 5,
            particleColor: Colors.grey,
            lineColor: Colors.grey,
            lineStrokeWidth: 0.2,
          ),
          FlutterTags(
            openTag: "Column(\n\t\t\tchildren: [",
            closeTag: "\t\t\t],\n),",
            expand: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text("")),
                //
                Column(
                  children: [
                    FlutterTags(
                      openTag: "Text(",
                      closeTag: "),",
                      expand: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi,", style: nameTextStyle)
                              .animate()
                              .fade(delay: 0.ms, duration: 300.ms),
                          Text("I'm Lucca,", style: nameTextStyle)
                              .animate()
                              .fade(delay: 300.ms, duration: 300.ms),
                          Text("Sofware Developer", style: nameTextStyle)
                              .animate()
                              .fade(delay: 600.ms, duration: 300.ms),
                        ],
                      ),
                    ),
                    FlutterTags(
                      openTag: "Text(",
                      closeTag: "),",
                      expand: false,
                      child: Text("Computer Enginieer - Full Stack Developer"),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //
                FlutterTags(
                  openTag: "Row(\n\t\t\tchildren: [",
                  closeTag: "\t\t\t],\n),",
                  expand: false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
