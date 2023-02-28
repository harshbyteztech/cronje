import 'package:bloc/bloc.dart';

import '../../model/document_model.dart';
import '../../model/insight_model.dart';
import '../../services/api_services.dart';
import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends Bloc<DocumentListEvent, DocumentListState> {
  DocumentBloc() : super(DocumentInitial()) {
    on<DocumentListGetEvent>((event, emit) async {
      emit(DocumentStateLoading());
      try {
        List<DocumentData>? list = await ApiServices().getDocument();
        emit(DocumentStateSuccess(list: list));
      } catch (e) {
        emit(DocumentStateFailure(error: e.toString()));
      }
    });
  }
}

