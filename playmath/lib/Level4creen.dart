import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:playmath/HomeScreen.dart';
import 'package:playmath/Wow4Screen.dart';
import 'package:playmath/homeProvider.dart';
import 'package:playmath/wanswerScreen.dart';
import 'package:playmath/wowScreen.dart';
import 'package:provider/provider.dart';

class Level4creen extends StatefulWidget {
  const Level4creen({Key? key}) : super(key: key);

  @override
  State<Level4creen> createState() => _Level4creenState();
}

class _Level4creenState extends State<Level4creen> {
  AssetsAudioPlayer? assetsAudioPlayer;

  AudioProvider? homeproviderTrue;
  AudioProvider? homeproviderFalse;
  @override
  void initState() {
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer();
    playAudio();
  }

  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/song/song.mp3"), autoStart: true);

    assetsAudioPlayer!.current.listen((event) {
      homeproviderFalse!.dura(event!.audio.duration);
    });
  }
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of<AudioProvider>(context, listen: true);
    homeproviderFalse = Provider.of<AudioProvider>(context, listen: false);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 130,
            width: double.infinity,
            color: Color(0xffFBDAB1),
            child: Text("Math is Fun!",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: IconButton(
                    onPressed: () {
                      homeproviderFalse!.play();

                      if (homeproviderFalse!.isPlay == false) {
                        assetsAudioPlayer!.play();
                      } else {
                        assetsAudioPlayer!.pause();
                      }
                    },
                    icon: homeproviderTrue?.isPlay == true
                        ? Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/Image/Off.png'),
                    )
                        :Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/Image/on.png'),
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> HomeScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('assets/Image/Home.png'),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How many bears?",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xffEE8B60)),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,

                child: Image.asset('assets/Image/Triangle.png',fit: BoxFit.fill,),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> WAnswerScreen()));
                },
                child: Container(
                  height: 50,
                  width: 120,
                  child: Image.asset('assets/Image/Card03.png',fit: BoxFit.fill,),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> Wow4Screen()));
                },
                child: Container(
                  height: 50,
                  width: 120,
                  child: Image.asset('assets/Image/Card08.png',fit: BoxFit.fill,),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> WAnswerScreen()));
                },
                child: Container(
                  height: 50,
                  width: 120,
                  child: Image.asset('assets/Image/Card06.png',fit: BoxFit.fill,),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> WAnswerScreen()));

                },
                child: Container(
                  height: 50,
                  width: 120,
                  child: Image.asset('assets/Image/Card04.png',fit: BoxFit.fill,),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}