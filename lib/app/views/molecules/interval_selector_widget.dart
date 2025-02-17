import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/core/constants/padding_size.dart';

class IntervalSelectorWidget extends StatefulWidget {
  final List<String> intervals;
  final ValueChanged<String> onSelected;
  final String? initialInterval;

  const IntervalSelectorWidget({
    super.key,
    required this.intervals,
    required this.onSelected,
    this.initialInterval,
  });

  @override
  State<IntervalSelectorWidget> createState() => _IntervalSelectorWidgetState();
}

class _IntervalSelectorWidgetState extends State<IntervalSelectorWidget> {
  String? _selectedInterval;

  @override
  void initState() {
    super.initState();
    if (widget.initialInterval != null &&
        widget.intervals.contains(widget.initialInterval)) {
      _selectedInterval = widget.initialInterval;
    } else if (widget.intervals.isNotEmpty) {
      _selectedInterval = widget.intervals.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: PaddingSize.small,
      alignment: WrapAlignment.center,
      children:
          widget.intervals.map((interval) {
            return ChoiceChip(
              label: Text(interval),
              selected: _selectedInterval == interval,
              showCheckmark: false,
              onSelected: (selected) {
                setState(() {
                  _selectedInterval = interval;
                });
                widget.onSelected(interval);
              },
            );
          }).toList(),
    );
  }
}
