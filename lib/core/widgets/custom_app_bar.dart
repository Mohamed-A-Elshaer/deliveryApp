import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(131);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.10),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? const SizedBox(),
          Expanded(
            child: Center(child: title),
          ),
          Row(children: actions ?? []),
        ],
      ),
    );
  }
}
