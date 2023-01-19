import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/models/topic_summary.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/topic_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<TopicSummary> topicSummary = [];
  late List<TopicSummary> datas = [];
  late TooltipBehavior _tooltip;
  var isLoaded = true;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    getTopicSummary();
    super.initState();
  }

  getTopicSummary() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    topicSummary = await TopicService()
        .getTopicSummary(token: authProvider.auth?.accessToken);

    setState(() {
      isLoaded = true;
      datas.addAll(topicSummary.map((e) => TopicSummary(e.topic, e.total)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SfCartesianChart(
        title: ChartTitle(text: 'Grafik Data Mahasiswa'),
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Topik')),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 20,
          interval: 5,
          title: AxisTitle(text: "Mahasiswa"),
        ),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<TopicSummary, String>>[
          ColumnSeries<TopicSummary, String>(
            dataSource: datas,
            xValueMapper: (TopicSummary data, _) => data.topic,
            yValueMapper: (TopicSummary data, _) => data.total,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            name: 'Topik',
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
