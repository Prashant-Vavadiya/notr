import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:playmath/homeProvider.dart';
import 'package:playmath/levelIScreen.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';

class Wow10Screen extends StatefulWidget {
  const Wow10Screen({Key? key}) : super(key: key);

  @override
  State<Wow10Screen> createState() => _Wow10ScreenState();
}

class _Wow10ScreenState extends State<Wow10Screen> {
  AssetsAudioPlayer? assetsAudioPlayer=AssetsAudioPlayer();

  AudioProvider? homeproviderTrue;
  AudioProvider? homeproviderFalse;

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/song/success.mp3"), autoStart: true);

    assetsAudioPlayer!.current.listen((event) {
      homeproviderFalse!.dura(event!.audio.duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of<AudioProvider>(context, listen: true);
    homeproviderFalse = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: IconButton(
                  onPressed: () {
                    homeproviderTrue!.playpuse();
                  },
                  icon: homeproviderTrue?.isPlay == true

                      ? Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset('assets/Image/Off.png'),
                        )
                      : Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset('assets/Image/on.png'),
                        ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "    Wow \n Wel Done",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEE8B60)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "???? ???? ????",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xfff8d702)),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('assets/Image/Home.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
