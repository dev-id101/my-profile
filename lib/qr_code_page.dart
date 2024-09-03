import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Figtree',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('Share Profile'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QrImageView(
                  data: 'This QR code has an embedded image as well',
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                ),
                const Text(
                  '@man.like.iniunam',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shareRow(
                      icon: const Icon(Icons.share), text: 'Share profile'),
                  shareRow(icon: const Icon(Icons.copy), text: 'Copy link'),
                  shareRow(icon: const Icon(Icons.download), text: 'Download')
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget shareRow({required Icon icon, required String text}) {
    return Column(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: Colors.grey.shade300),
          child: icon,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
