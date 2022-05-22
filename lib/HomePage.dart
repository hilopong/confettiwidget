import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _controller=ConfettiController();
  bool isPlaying=false;
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: MaterialButton(
              onPressed: (){
                if(isPlaying){
                  _controller.stop();

                }else{
                  _controller.play();
                }

                isPlaying=!isPlaying;
              },
              child: Text('Party Time'),
              color: Colors.deepPurple[200],
            ),
          ),
        ),
        ConfettiWidget(
            confettiController: _controller,
            blastDirection: pi / 2,
          colors: [
            Colors.deepPurple,
            Colors.yellow
          ],
          gravity: 0.1,
          emissionFrequency: 0.5,
        )
      ],
    );
  }
}
