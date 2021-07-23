import 'package:flutter/material.dart';
import 'package:bar_code_reader/bloc/Bloc.dart';

//https://github.com/ConProgramming/flutter-example/blob/master/lib/bloc/bloc-prov.dart
class BlocProvider<T extends Bloc> extends InheritedWidget {
  final T bloc;

  final Widget child;

  BlocProvider({Key key,
  @required this.bloc, this.child}) : assert(bloc != null), super(key: key, child: child);

  static of<T extends Bloc>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    final BlocProvider<T> provider = context
        .ancestorInheritedElementForWidgetOfExactType(type)
        ?.widget as BlocProvider<T>;
    return provider?.bloc;
  }

  BlocProvider<T> copyWith(Widget child) {
    return BlocProvider<T>(
      key: key,
      bloc: bloc,
      child: child,
    );
  }

  static Type _typeOf<T>() => T;


  @override
  bool updateShouldNotify(BlocProvider oldWidget) => false;


}