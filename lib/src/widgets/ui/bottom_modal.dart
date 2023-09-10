import 'package:flutter/material.dart';

class _BottomModalHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 8,
        width: 128,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
      );
}

class BottomModal extends StatelessWidget {
  final BuildContext context;
  final String title;
  final bool withHandler;
  final List<Widget> children;

  const BottomModal(
      {super.key,
      required this.context,
      this.title = "",
      this.withHandler = true,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        withHandler ? _BottomModalHandler() : const SizedBox(height: 16),
        const SizedBox(height: 16),
        title.isNotEmpty
            ? Text(title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            : const SizedBox(height: 0),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  static void open(BottomModal modal) {
    showModalBottomSheet<void>(
      context: modal.context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return BottomModal(
          context: modal.context,
          children: modal.children,
        );
      },
    );
  }
}
