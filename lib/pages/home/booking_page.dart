import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/models/topics.dart';
import 'package:psikolog/pages/home/offline_page.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/schedule_service.dart';

class BookingPage extends StatefulWidget {
  final Topics topics;
  const BookingPage({super.key, required this.topics});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    createCounselling() async {
      setState(() {
        isLoading = true;
      });

      if (await ScheduleService().postSchedules(
        token: authProvider.auth?.accessToken,
        topicId: widget.topics.id,
        type: 1,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Error! Create Schedule has been failed",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Layanan Psikolog',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
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
              const SizedBox(
                height: 20,
              ),
              // Topic
              Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Topik',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    Text(
                      '${widget.topics.title}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              // End of Topic
              const SizedBox(
                height: 15,
              ),
              // Category
              Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pilih Layanan Konsultasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OfflinePage(
                                    topics: widget.topics,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/meet-offline.png',
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Tatap Muka',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: createCounselling,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/meet-online.png',
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Chat',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // End of Category
            ],
          ),
        ),
      ),
    );
  }
}
