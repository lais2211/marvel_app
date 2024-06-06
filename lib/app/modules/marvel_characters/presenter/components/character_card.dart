import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  int imageFlex;
  int textFlex;

  CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.imageFlex,
    required this.textFlex,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: widget.imageFlex,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            height: 5,
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
          ),
          Flexible(
            flex: widget.textFlex,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
