import 'package:flutter/material.dart';

class RemoveRoundButton extends StatelessWidget {
  final VoidCallback onTap;
  const RemoveRoundButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.red.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0.1),
            color: Colors.grey,
            blurRadius: 5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                'remove',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.white),
              ),
            )),
      ),
    );
  }
}