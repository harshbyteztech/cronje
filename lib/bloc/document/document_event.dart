import 'package:cronje/model/document_model.dart';
import 'package:equatable/equatable.dart';

abstract class DocumentListEvent extends Equatable {
  const DocumentListEvent();
}

class DocumentListGetEvent extends DocumentListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
