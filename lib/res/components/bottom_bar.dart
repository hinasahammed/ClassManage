import 'package:class_manage/ui/allStudents/all_students_view.dart';
import 'package:class_manage/ui/upload/upload_view.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final List pages = [
    const UploadView(),
    const AllStudentsView(),
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
