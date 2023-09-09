import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/colors.dart';
import '../buttons/button_action.dart';

class AppBarDefault extends StatelessWidget {
  const AppBarDefault({
    Key? key,
    this.icBack = true,
    this.actions = const [],
    required this.titleWidget,
    this.centerTitle = false,
    this.withLeading = true,
    this.useShadow = true,
    this.onTapBack = onTapBackDefault
  }) : super(key: key);
  final bool icBack;
  final List<Widget> actions;
  final Widget titleWidget;
  final bool centerTitle;
  final bool withLeading;
  final bool useShadow;
  final VoidCallback onTapBack;

  static onTapBackDefault(){
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 16,
        left: icBack == false? 0 : 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: kColorPureWhite,
        boxShadow: useShadow
            ? [
          BoxShadow(
            color: kColorPureBlack.withOpacity(0.1),
            offset: const Offset(0, 0.5),
            blurRadius: 2,
          )
        ]
            : null,
      ),
      child: Row(
        children: [
          withLeading ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: ButtonAction(onTap: onTapBack, child: icBack == true? const Icon(Icons.arrow_back_ios) : const SizedBox()),
          ) : const SizedBox(width: 18,),
          // IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   padding: EdgeInsets.zero,
          //   constraints: const BoxConstraints(),
          //   icon: const Icon(Icons.arrow_back_ios),
          // ),
          Expanded(child: titleWidget),
          const SizedBox(width: 8),
          Row(
            children: actions,
          )
        ],
      ),
    );
  }
}
