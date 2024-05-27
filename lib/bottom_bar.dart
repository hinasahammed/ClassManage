import 'package:class_manage/all_students.dart';
import 'package:class_manage/upload.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final List pages = [
    const Upload(),
    const AllStudents(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: theme.colorScheme.primary,
        selectedFontSize: 16,
        iconSize: 26,
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(.3),
        unselectedItemColor: theme.colorScheme.onSurface.withOpacity(.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_outlined),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Students',
          ),
        ],
      ),
    );
  }
}
