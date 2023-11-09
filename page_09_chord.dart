import 'package:flutter/material.dart';

class ChordDisplayPage extends StatefulWidget {
  @override
  _ChordDisplayPageState createState() => _ChordDisplayPageState();
}

class _ChordDisplayPageState extends State<ChordDisplayPage> {
  List<String> chords = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
  final List<String> chords_ii = ['Dm', 'D#m', 'Em', 'Fm', 'F#m', 'Gm', 'G#m', 'Am', 'A#m', 'Bm', 'Cm', 'C#m'];
  final List<String> chords_iii = ['Em', 'Fm', 'F#m', 'Gm', 'G#m', 'Am', 'A#m', 'Bm', 'Cm', 'C#m', 'Dm', 'D#m'];
  final List<String> chords_IV = ['F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E'];
  final List<String> chords_v = ['G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#'];
  final List<String> chords_vi = ['Am', 'A#m', 'Bm', 'Cm', 'C#m', 'Dm', 'D#m', 'Em', 'Fm', 'F#m', 'Gm', 'G#m'];
  final List<String> chords_vii = ['B dim', 'C dim', 'C# dim', 'D dim', 'D# dim', 'E dim', 'F dim', 'F# dim', 'G dim', 'G# dim', 'A dim', 'A# dim'];

  int currentIndex = 0;

  void incrementIndex() {
    setState(() {
      currentIndex = (currentIndex + 1) % chords.length;
    });
  }

  void decrementIndex() {
    setState(() {
      currentIndex = (currentIndex - 1 + chords.length) % chords.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chord Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    _buildChordTableCell(chords[currentIndex]),
                    _buildChordTableCell(chords_ii[currentIndex]),
                    _buildChordTableCell(chords_iii[currentIndex]),
                    _buildChordTableCell(chords_IV[currentIndex]),
                    _buildChordTableCell(chords_v[currentIndex]),
                    _buildChordTableCell(chords_vi[currentIndex]),
                    _buildChordTableCell(chords_vii[currentIndex]),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrementIndex,
                  child: Text('Previous Chord'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: incrementIndex,
                  child: Text('Next Chord'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChordTableCell(String chord) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            chord,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}