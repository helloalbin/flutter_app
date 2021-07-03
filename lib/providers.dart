import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ValueNotifier<double>>(
    create: (context) => ValueNotifier<double>(0),
  ),
];
