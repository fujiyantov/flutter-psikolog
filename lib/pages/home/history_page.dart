import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:psikolog/datas/histories.dart';
import 'package:psikolog/models/schedules.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/schedule_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<Schedules> schedules;
  var isLoaded = false;
  var itemCount = 0;

  @override
  void initState() {
    super.initState();
    getTopic();
  }

  getTopic() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    schedules = await ScheduleService()
        .getAll(token: authProvider.auth?.accessToken.toString());

    if (schedules.length.toInt() > 0) {
      setState(() {
        isLoaded = true;
        itemCount = schedules.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // History
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Riawayat Konsultasi',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                      itemCount: itemCount,
                      // itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.maxFinite,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              schedules[index].topicName.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // End of History
        ],
      ),
    );
  }
}
