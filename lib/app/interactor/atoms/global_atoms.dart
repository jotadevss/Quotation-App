import 'package:asp/asp.dart';

final loadingState$ = Atom<bool>(false);

// Getters
bool get loading => loadingState$.value;
