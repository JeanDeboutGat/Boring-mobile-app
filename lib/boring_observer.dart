import 'package:bloc/bloc.dart';

/// {@template boring_observer}
/// [BlocObserver] for the boring app which
/// observes all state changes.
/// {@endtemplate}
class BoringObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}