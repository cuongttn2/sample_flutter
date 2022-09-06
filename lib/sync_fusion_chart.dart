import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.name, this.value);
  final String name;
  final double value;
}


class ChartView extends StatelessWidget {
  const ChartView(
      {Key? key,
      required this.dataSource,
      required this.maxY,
      required this.minY})
      : super(key: key);
  final List<ChartData>? dataSource;
  final double? maxY;
  final double? minY;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          margin: const EdgeInsets.fromLTRB(10, 10, 15, 10),
          plotAreaBorderWidth: 0,
          title: ChartTitle(
              text: 'Bar Chart',
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 25)),
          // annotations:,
          primaryXAxis: CategoryAxis(
            rangePadding: ChartRangePadding.additional,
            labelPlacement: LabelPlacement.onTicks,
            isVisible: true,
            majorGridLines: const MajorGridLines(width: 0),
            placeLabelsNearAxisLine: false,
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            axisLine: const AxisLine(width: 0),
            minimum: minY ?? 0,
            maximum: maxY ?? 3,
            majorTickLines: const MajorTickLines(size: 0, width: 0),
            autoScrollingMode: AutoScrollingMode.start,
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
          ),

          series: _getSeries(),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            header: '',
            canShowMarker: false,
            shouldAlwaysShow: false,
          ),
        ),
      ),
    );
  }

    List<ChartSeries<ChartData, String>> _getSeries() {
    return <ChartSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
          color: Colors.blue.withOpacity(0.4),
          borderColor: Colors.blue,
          borderWidth: 2,
          dataSource: dataSource ??
              <ChartData>[
                ChartData('1', 1),
                ChartData('2', 2),
                ChartData('3', 1),
                ChartData('4', 2),
                ChartData('5', 1),
                ChartData('6', 2),
                ChartData('7', 2),
              ],
          xValueMapper: (ChartData data, _) => data.name,
          yValueMapper: (ChartData data, _) => data.value,
          dataLabelMapper: (ChartData data, _) =>
              "${data.value.toStringAsFixed(2)} M",
          markerSettings: const MarkerSettings(isVisible: true),
          dataLabelSettings: const DataLabelSettings(
              // Renders the data label
              isVisible: true),
          trendlines: (dataSource!.length > 2)
              ? [
                  Trendline(
                    type: TrendlineType.linear,
                    color: Colors.blue,
                    opacity: 0.3,
                  )
                ]
              : []),
    ];
  }
}
