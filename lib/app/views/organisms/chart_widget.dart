import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatefulWidget {
  final List<double> data;

  final double thickness;
  final List<Color> gradientColors;
  final double? initialData;
  final double? interval;
  final List<String> horizontalLines;
  final String format;
  final bool showTouchTooltip;

  const ChartWidget({
    super.key,
    required this.data,
    this.thickness = 1,
    this.gradientColors = const [Color(0xFFFFFFFF), Color(0x00FFFFFF)],
    this.initialData,
    this.interval,
    this.horizontalLines = const [],
    this.format = '',
    this.showTouchTooltip = false,
  });

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        lineTouchData: LineTouchData(
          enabled: widget.showTouchTooltip,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems:
                (touchedSpots) =>
                    touchedSpots
                        .map(
                          (spot) => LineTooltipItem(
                            NumberFormat.simpleCurrency().format(spot.y),
                            const TextStyle(),
                          ),
                        )
                        .toList(),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (int i = 0; i < widget.data.length; i++)
                FlSpot(i.toDouble(), widget.data[i]),
            ],
            isCurved: true,
            barWidth: widget.thickness,
            isStrokeCapRound: true,
            color: widget.gradientColors.first,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors:
                    widget.gradientColors
                        .map((color) => color.withValues(alpha: 0.3))
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
