import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FutureMessageBubble extends StatelessWidget {
  const FutureMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'mR rObOT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
          //* in the code is stablish that the width of the picture will be 50% of the phone actual width size
          width: size.width * 0.5,
          height: 150,
          loadingBuilder: (context, child, loadingProgress) {
            //* here is ask if the loadingProgress has finished
            if (loadingProgress == null) {
              return child;
            } else {
              return Text('loading pa');
            }
          },
          fit: BoxFit.cover,
        ));
  }
}
