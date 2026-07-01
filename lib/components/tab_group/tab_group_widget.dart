import '/components/tab_item/tab_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tab_group_model.dart';
export 'tab_group_model.dart';

class TabGroupWidget extends StatefulWidget {
  const TabGroupWidget({
    super.key,
    String? label2,
    bool? label2Present,
    String? label3,
    bool? label3Present,
    String? label4,
    bool? label4Present,
    String? label5,
    bool? label5Present,
    String? label1,
    int? selectedIndex,
    this.onTabChanged,
  })  : this.label2 = label2 ?? 'Register',
        this.label2Present = label2Present ?? true,
        this.label3 = label3 ?? 'Reports',
        this.label3Present = label3Present ?? true,
        this.label4 = label4 ?? '',
        this.label4Present = label4Present ?? false,
        this.label5 = label5 ?? '',
        this.label5Present = label5Present ?? false,
        this.label1 = label1 ?? 'Login',
        this.selectedIndex = selectedIndex ?? 0;

  final String label2;
  final bool label2Present;
  final String label3;
  final bool label3Present;
  final String label4;
  final bool label4Present;
  final String label5;
  final bool label5Present;
  final String label1;
  final int selectedIndex;
  final void Function(int)? onTabChanged;

  @override
  State<TabGroupWidget> createState() => _TabGroupWidgetState();
}

class _TabGroupWidgetState extends State<TabGroupWidget> {
  late TabGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabGroupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  List<String> get _presentLabels {
    final labels = [widget.label1];
    if (widget.label2Present) labels.add(widget.label2);
    if (widget.label3Present) labels.add(widget.label3);
    if (widget.label4Present) labels.add(widget.label4);
    if (widget.label5Present) labels.add(widget.label5);
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    final labels = _presentLabels;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: labels.asMap().entries.map((entry) {
            final idx = entry.key;
            final label = entry.value;
            return Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: widget.onTabChanged != null
                    ? () => widget.onTabChanged!(idx)
                    : null,
                child: TabItemWidget(
                  label: label,
                  selected: widget.selectedIndex == idx,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
