import 'package:flutter/material.dart';

class FutureMessageBubble extends StatelessWidget {
  final String text;
  final String img;
  const FutureMessageBubble({super.key, required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          image: img,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;
  const _ImageBubble({required this.image});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        //* in the code is stablish that the width of the picture will be 50% of the phone actual width size
        width: size.width * 0.5,
        height: 150,
        loadingBuilder: (context, child, loadingProgress) {
          //* here is ask if the loadingProgress has finished
          if (loadingProgress == null) {
            return child;
          } else {
            return const Text('loading pa');
          }
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
