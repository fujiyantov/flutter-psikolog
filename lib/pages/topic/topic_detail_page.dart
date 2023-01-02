import 'package:flutter/material.dart';
import 'package:psikolog/models/topics.dart';
import 'package:psikolog/pages/home/booking_page.dart';

class TopicDetailPage extends StatefulWidget {
  final Topics topics;
  const TopicDetailPage({super.key, required this.topics});

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Topik',
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
                      '${widget.topics.image}',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text(
                '${widget.topics.title}',
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
                  '${widget.topics.description}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingPage(topics: widget.topics),
            ),
          );
        },
        label: const Text(
          'Lanjutkan Konsultasi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
