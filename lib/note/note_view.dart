import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("note")));
  }

  @override
  bool get wantKeepAlive => true;
}
