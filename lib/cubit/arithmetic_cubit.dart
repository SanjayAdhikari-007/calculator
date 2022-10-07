import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'arithmetic_state.dart';

class ArithmeticCubit extends Cubit<ArithmeticState> {
  ArithmeticCubit() : super(ArithmeticInitial());
}
