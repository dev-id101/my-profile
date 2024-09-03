import 'package:flutter/material.dart';

Future showAppBottomSheet({
  required BuildContext context,
  required Widget child,
  String? title,
  String? closeText,
  bool showCloseButton = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
}) async {
  var res = await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: title != null || showCloseButton,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title ?? '',
                                  style: const TextStyle(
                                      fontFamily: 'Figtree',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Visibility(
                                visible: showCloseButton,
                                child: Material(
                                  child: Ink(
                                    color: Colors.white,
                                    child: InkWell(
                                        onTap: () {
                                          // Navigation.back(context: context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          // child: SvgPicture.asset('svgs/close_bottom_sheet_icon.svg'),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // content
                      SafeArea(child: child),

                      // space
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

  return res;
}
