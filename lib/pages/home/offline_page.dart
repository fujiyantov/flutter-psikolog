import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/models/topics.dart';
import 'package:intl/intl.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/schedule_service.dart';

class OfflinePage extends StatefulWidget {
  final Topics? topics;
  const OfflinePage({super.key, this.topics});

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  bool isLoading = false;
  // form filed
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TimeOfDay? time = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    // provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    createCounselling() async {
      setState(() {
        isLoading = true;
      });

      if (await ScheduleService().postSchedules(
        token: authProvider.auth?.accessToken,
        topicId: widget.topics?.id,
        date: dateinput.text,
        time: timeInput.text,
        type: 0,
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
          'Tatap Muka',
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
                      '${widget.topics?.title}',
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
              // DateTime
              Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pilih Tanggal dan Waktu',
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
                      height: 25,
                    ),
                    // Date
                    TextField(
                      readOnly: true,
                      controller: dateinput,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                            pickedDate,
                          ); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                            formattedDate,
                          ); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tanggal',
                      ),
                    ),
                    // End of Date
                    const SizedBox(
                      height: 25,
                    ),
                    // Time
                    TextField(
                      readOnly: true,
                      controller: timeInput,
                      onTap: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time!,
                        );

                        if (newTime != null) {
                          String formattedTimeOfDay =
                              localizations.formatTimeOfDay(newTime);
                          print(formattedTimeOfDay);

                          setState(() {
                            timeInput.text = formattedTimeOfDay;
                          });
                        } else {
                          print("Time is not selected");
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Waktu',
                      ),
                    ),
                    // End of Time
                  ],
                ),
              ),
              // End of // DateTime
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed:
                    (timeInput.text.isNotEmpty && dateinput.text.isNotEmpty)
                        ? createCounselling
                        : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
