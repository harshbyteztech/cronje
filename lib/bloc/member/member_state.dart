import 'package:cronje/model/member_model.dart';
import 'package:equatable/equatable.dart';

abstract class MemberListState extends Equatable {
  const MemberListState();
}

class MemberInitial extends MemberListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MemberStateLoading extends MemberListState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MemberStateSuccess extends MemberListState {
  List<Member>? list;

  MemberStateSuccess({this.list});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MemberStateFailure extends MemberListState {
  final String error;

  const MemberStateFailure({required this.error});

  @override
  List<Object> get props => [error];
}
