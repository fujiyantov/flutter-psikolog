import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/models/schedules.dart';
import 'package:psikolog/pages/chat_page.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/schedule_service.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
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
        .getPending(token: authProvider.auth?.accessToken);

    if (schedules.length.toInt() > 0) {
      setState(() {
        isLoaded = false;
        itemCount = schedules.length;
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
          'Jadwal Konsultasi',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListView.builder(
          itemCount: itemCount,
          // itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: double.maxFinite,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black26),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined,
                          size: 12, color: Colors.black),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${schedules[index].createdAt}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Status',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Text(
                        schedules[index].statusName.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Topik',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Text(
                        schedules[index].topicName.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Layanan',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Text(
                        schedules[index].type == 1 ? 'Tatap Muka' : 'Chat',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Jadwal',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      Text(
                        '${schedules[index].date} ${schedules[index].time}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  schedules[index].type == 1
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Container(
                              width: 80,
                              child: Text(
                                'Keterangan',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Text(': '),
                            Text(
                              schedules[index].description != null ? '${schedules[index].description}' : '-',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        )
                      : schedules[index].status == 2 ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  schedules: schedules[index],
                                ),
                              ),
                            );
                          },
                          child: Text('Chat'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, elevation: 0),
                        ) : Container(),
                  /* Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Diagnosis',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(': '),
                      SizedBox(
                        width: 200,
                        child: Text(
                          schedules[index].diagnosis != null
                              ? schedules[index].diagnosis.toString()
                              : '-',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ) */
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
