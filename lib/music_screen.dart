import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:just_audio/just_audio.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final AudioPlayer _player = AudioPlayer();
  int? _current;

  final List<Map<String, String>> _tracks = [
    {
      'title': 'Sakin 1',
      'file': 'nastelbom-calm-ambient-295786.mp3',
    },
    {
      'title': 'Sakin 2',
      'file': 'velariomusic-calm-ambient-603158.mp3',
    },
    {
      'title': 'Sakin 3',
      'file': 'morgan-ambient-calm-ambient-dreamscape-529861.mp3',
    },
    {
      'title': 'Meditasyon 1',
      'file': 'leberch-meditation-578429.mp3',
    },
    {
      'title': 'Meditasyon 2',
      'file': 'verclub_music-meditation-music-550885.mp3',
    },
  ];

  Future<void> _toggle(int index) async {
    try {
      if (_current == index) {
        if (_player.playing) {
          await _player.pause();
        } else {
          _player.play();
        }
        return;
      }
      final url = await FirebaseStorage.instance
          .ref('muzik/${_tracks[index]['file']}')
          .getDownloadURL();
      await _player.setUrl(url);
      setState(() => _current = index);
      _player.play();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Şarkı açılamadı: $e')),
      );
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sakinleştirici Müzik')),
      body: ListView.builder(
        itemCount: _tracks.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(
              _current == i ? Icons.graphic_eq : Icons.music_note,
            ),
            title: Text(_tracks[i]['title']!),
            onTap: () => _toggle(i),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: StreamBuilder<PlayerState>(
          stream: _player.playerStateStream,
          builder: (context, snapshot) {
            final playing = snapshot.data?.playing ?? false;
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 56,
                    icon: Icon(
                      playing ? Icons.pause_circle : Icons.play_circle,
                    ),
                    onPressed: () => _toggle(_current ?? 0),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
