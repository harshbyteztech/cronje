import 'package:bloc/bloc.dart';
import 'package:cronje/bloc/member/member_state.dart';

import '../../model/member_model.dart';
import '../../services/api_services.dart';
import 'member_event.dart';

class MemberBloc extends Bloc<MemberListEvent, MemberListState> {
  MemberBloc() : super(MemberInitial()) {
    on<MemberListGetEvent>((event, emit) async {
      emit(MemberStateLoading());
      try {
        List<Member>? list = await ApiServices().getMember();
        emit(MemberStateSuccess(list: list));
      } catch (e) {
        emit(MemberStateFailure(error: e.toString()));
      }
    });
  }
}
