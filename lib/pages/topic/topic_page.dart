import 'package:flutter/material.dart';
import 'package:psikolog/components/topic_card.dart';
import 'package:psikolog/models/topics.dart';
import 'package:psikolog/services/topic_service.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  late List<Topics> topics;
  var isLoaded = false;
  var itemCount = 0;

  @override
  void initState() {
    super.initState();
    getTopic();
  }

  getTopic() async {
    topics = await TopicService().getAll();

    if (topics.length.toInt() > 0) {
      setState(() {
        isLoaded = true;
        itemCount = topics.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Pilih Topik',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        backgroundColor: Colors.white,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: ListView.builder(
            itemCount: itemCount,
            // itemCount: 5,
            itemBuilder: (context, index) {
              return TopicCard(topics: topics[index]);
            },
          ),
        ),
      ),
    );
  }
}
