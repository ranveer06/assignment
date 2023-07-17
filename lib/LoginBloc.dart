import 'dart:async';

import 'package:bloc/bloc.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';
import 'Utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    print("IN LOGIN BLOC COns");
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    print("xxxx");
    final email = event.email;
    final password =event.password;
    print("in event handler " + email + " " + password);
    emit(
      state.copyWith(
        isValid: Utils.isEmailPasswordValid(email, password)
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: "In Progress"));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: "Success"));
    }
  }
}