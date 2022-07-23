import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

AudioPlayer audioPlayer = AudioPlayer();
AudioCache audioCache = AudioCache();

List imgList = [
  'Ad.jpg',
  'Angel_Baby.png',
  'tonytony.jpg',
  'ghost.png',
  'Way back.jpg',
  'Let_Somebody.jpeg'
];

List songList = [
  'Amazing_Day',
  'Angel_Baby',
  'Ghost',
  'Hugh_Grant_Haley',
  'Let_Somebody_go',
  'onone_piece_song',
];


class musichomepage extends StatefulWidget {
  const musichomepage({Key? key,}) : super(key: key);

  @override
  State<musichomepage> createState() => _musicappState();
}

class _musicappState extends State<musichomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Music App",
          style: GoogleFonts.gloriaHallelujah(
            textStyle: const TextStyle(color: Colors.orange, letterSpacing: .5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MusicApp(
              image: imgList[0],
              song: songList[0],
              songname: 'Amazing Day',
            ),
            MusicApp(
              image: imgList[1],
              song: songList[1],
              songname: 'Angel Baby',
            ),
            MusicApp(
              image: imgList[3],
              song: songList[2],
              songname: 'Ghost',
            ),
            MusicApp(
              image: imgList[4],
              song: songList[3],
              songname: 'Way Back Into Love',
            ),
            MusicApp(
              image: imgList[5],
              song: songList[4],
              songname: 'Let Somebody Go',
            ),
            MusicApp(
              image: imgList[2],
              song: songList[5],
              songname: 'One Piece',
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MusicApp extends StatelessWidget {
  // Function playLocal;

  var songname;
  var image;
  var song;

  MusicApp({
    Key? key,
    this.songname,
    required this.image,
    required this.song,
  }) : super(key: key);

  playLocal() async {
    await audioCache.play('sounds/$song.mp3');
  }

  // ignore: non_constant_identifier_names
  bool play_pause = true;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: GlassContainer(
              borderColor: Colors.amber,
              height: 100,
              width: 100,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.10),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.10),
                  Colors.purpleAccent.withOpacity(0.05),
                  Colors.purpleAccent.withOpacity(0.60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 20,
              borderRadius: BorderRadius.circular(10.0),
              borderWidth: 1.0,
              elevation: 3.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/$image'),
                        fit: BoxFit.fill,
                      ), 
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            songname,
              style: GoogleFonts.gloriaHallelujah(
                    textStyle: const TextStyle(
                        color: Colors.orange, letterSpacing: .5),
              ),
          ),
          GlassContainer(
            borderColor: Colors.redAccent,
            height: 50,
            width: 50,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.40),
                Colors.white.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.60),
                Colors.black.withOpacity(0.10),
                Colors.blue.withOpacity(0.05),
                Colors.blue.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            borderRadius: BorderRadius.circular(50.0),
            borderWidth: 1.0,
            elevation: 3.0,
            child: IconButton(
              onPressed: () async {
                playLocal();
              },
              icon: play_pause
                  ? const Icon(
                      Icons.play_arrow,
                    )
                  : const Icon(Icons.pause),
            ),
          ),
        ],
      ),
    );
  }
}
