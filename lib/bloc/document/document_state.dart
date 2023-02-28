import 'package:equatable/equatable.dart';

import '../../model/document_model.dart';
import '../../model/insight_model.dart';

abstract class DocumentListState extends Equatable {
  const DocumentListState();
}

class DocumentInitial extends DocumentListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DocumentStateLoading extends DocumentListState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DocumentStateSuccess extends DocumentListState {
  List<DocumentData>? list;

  DocumentStateSuccess({this.list});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DocumentStateFailure extends DocumentListState {
  final String error;

  const DocumentStateFailure({required this.error});

  @override
  List<Object> get props => [error];
}
