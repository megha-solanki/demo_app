import 'dart:developer';

import 'package:demo_app/bloc/app_events.dart';
import 'package:demo_app/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UseRepository userRepository;

  UserBloc(this.userRepository) : super(UserLoadingState()) {
    log("bloc is calling");
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
