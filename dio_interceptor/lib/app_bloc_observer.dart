// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange ${bloc.runtimeType}'
        'From: ${change.currentState}'
        'To: ${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('Close ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('Create ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error in : ${bloc.runtimeType}'
        'Error: $error'
        'StackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
