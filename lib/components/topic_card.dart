import 'package:flutter/material.dart';
import 'package:psikolog/models/topics.dart';
import 'package:psikolog/pages/home/booking_page.dart';
// import 'package:psikolog/pages/topic/topic_detail_page.dart';

class TopicCard extends StatelessWidget {
  final Topics topics;
  const TopicCard({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingPage(
              topics: topics,
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
              '${topics.image}',
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
                  '${topics.title}',
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
