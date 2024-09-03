import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_am_poor/components/bottom_sheets.dart';
import 'package:i_am_poor/components/projects_card.dart';
import 'package:i_am_poor/contact_bottom_sheet.dart';
import 'package:i_am_poor/qr_code_page.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(30)),
          shadowColor: Colors.black,
          surfaceTintColor: Colors.black,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Figtree',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          title: const Text('My profile'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Ink(
                // color: Colors.black,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const QrCodePage()));
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Share profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 37,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 100.0,
                          backgroundImage: AssetImage('images/myself_2.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Iniunam Idorenyin',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Figtree',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'FLUTTER DEVELOPER',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Figtree',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                        width: 150.0,
                        child: Divider(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconWidget(
                              icon: SvgPicture.asset('svgs/instagram_logo.svg'),
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                      'https://www.instagram.com/man.like.iniunam?igsh=ZHJscWk5OHZ3Zmd4'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                          const SizedBox(width: 8),
                          iconWidget(
                              icon: SvgPicture.asset('svgs/dark_x_logo.svg'),
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                      'https://x.com/IniunamId123?t=UjJHwI5eOzWNkjk1cSVaIg&s=09'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                          const SizedBox(width: 8),
                          iconWidget(
                              icon: SvgPicture.asset('svgs/linkedin_logo.svg'),
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                      'https://www.linkedin.com/in/idorenyin-iniunam-125151289?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                          const SizedBox(width: 8),
                          iconWidget(
                              icon: SvgPicture.asset('svgs/github_logo.svg'),
                              onTap: () {
                                launchUrl(
                                  Uri.parse('https://github.com/dev-ID101'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showAppBottomSheet(
                              context: context,
                              showCloseButton: true,
                              title: 'Get in touch',
                              child: const ContactBottomSheet());
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(
                            3,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey.shade200,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          shadowColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                        ),
                        child: const Text(
                          'Contact Me',
                          style: TextStyle(
                            fontFamily: 'Figtree',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Published apps',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Figtree',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        ProjectCard(
                          text: 'Pacific Mobile',
                        ),
                        ProjectCard(
                          text: 'Uplift',
                        ),
                        ProjectCard(
                          text: 'Uplift Ambassadors',
                        ),
                        ProjectCard(
                          text: 'Cruudy',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Container(
            //     padding: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         border:
            //             const Border(bottom: BorderSide(color: Colors.black)),
            //         color: Colors.grey.shade300),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             const SizedBox(
            //               width: 8,
            //             ),
            //             const Expanded(
            //               child: Text(
            //                 'Profile',
            //                 style: TextStyle(
            //                     fontSize: 25,
            //                     fontWeight: FontWeight.w900,
            //                     color: Colors.black),
            //               ),
            //             ),
            //             Ink(
            //               color: Colors.black,
            //               child: InkWell(
            //                 onTap: () {},
            //                 borderRadius: BorderRadius.circular(8),
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(200),
            //                     border: Border.all(color: Colors.black),
            //                   ),
            //                   padding: const EdgeInsets.all(8),
            //                   child: const Row(
            //                     mainAxisSize: MainAxisSize.min,
            //                     children: [
            //                       // AppImages.svgSmallShareIcon,
            //                       SizedBox(
            //                         width: 4,
            //                       ),
            //                       Text(
            //                         'Share profile',
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: 11,
            //                             fontWeight: FontWeight.w600),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }

  Widget iconWidget({required SvgPicture icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Card(
        color: Colors.grey.shade200,
        shadowColor: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
