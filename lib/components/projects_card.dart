import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Figtree',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        trailing: Ink(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(8),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'View app',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Figtree',
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
