import 'package:flutter/material.dart';
import 'package:psikolog/models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Artikel',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.dstATop,
                    ),
                    image: NetworkImage(
                      '${news.image}',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text(
                '${news.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  '${news.content}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.9,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
