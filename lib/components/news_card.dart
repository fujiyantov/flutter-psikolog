import 'package:flutter/material.dart';
import 'package:psikolog/models/news.dart';
import 'package:psikolog/pages/news/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              news: news,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
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
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 20,
              child: SizedBox(
                width: 200,
                child: Text(
                  '${news.title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
