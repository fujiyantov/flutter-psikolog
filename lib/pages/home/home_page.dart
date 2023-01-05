import 'package:flutter/material.dart';
import 'package:psikolog/components/news_card.dart';
import 'package:psikolog/models/news.dart';
import 'package:psikolog/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<News> news;
  var isLoaded = false;
  var itemCount = 0;

  @override
  void initState() {
    super.initState();
    getAllNews();
  }

  getAllNews() async {
    news = await NewsService().getAll();

    if (news.length.toInt() > 0) {
      setState(() {
        isLoaded = true;
        itemCount = news.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          // Action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/topics');
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/images/psychologist.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Konsultasi',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        'assets/images/schedule.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Jadwal Konseling',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          // End of Action
    
          // Artikel
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: Text(
              'Artikel Terbaru',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
    
          Visibility(
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
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (contex, index) {
                  return NewsCard(news: news[index]);
                },
              ),
            ),
          ),
          // End of Artikel
        ],
      ),
    );
  }
}
