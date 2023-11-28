
import 'package:flutter/material.dart';

void showBookmarksDialog({required BuildContext context, required List bookmarks}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Bookmarks'),
        content: SingleChildScrollView(
          child: Column(
            children: bookmarks
                .map((bookmark) => ListTile(
              title: Text('${bookmark['courseModuleName']} at ${bookmark['courseModuleBookMarkTime']}s'),
            ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}