import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SheetsUtils {
  static bottomSheet(BuildContext context,
      {required Widget items, required String title}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => SingleChildScrollView(
        child: Container(
            color: Theme.of(context).indicatorColor,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: _content(context, items, title)),
      ),
    );
  }

  static _content(BuildContext context, Widget items, String title) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white, width: 1.5)),
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _headerWidget(context, title),
              items,
            ],
          ).paddingAll(10)),
    );
  }

  static _headerWidget(BuildContext context, String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .primaryTextTheme
              .titleLarge!
              .apply(fontSizeDelta: -1),
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
      ),
      Container(
          width: 30,
          padding: const EdgeInsets.only(bottom: 20),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close,
                size: 30,
              ))).paddingOnly(left: 18),
    ]);
  }
}
