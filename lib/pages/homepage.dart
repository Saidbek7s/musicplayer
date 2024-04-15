import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mydrower.dart';
import 'package:flutter_application_1/pages/playlist_provider.dart';
import 'package:flutter_application_1/pages/song.dart';
import 'package:flutter_application_1/pages/songpage.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final dynamic playlistProvider;
  @override
  void initState() {
    super.initState();

    //get playsilt provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    //update
    playlistProvider.currentSongIndex = songIndex;

    //navigator to song
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search))
        ],
        title: const Center(
          child: Text("P L A Y L I S T"),
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (contex, value, child) {
          final List<Song> playlist = value.playlist;
          //return list wiev ui

          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (contex, index) {
              final Song song = playlist[index];

              //retur list tile ui
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}

