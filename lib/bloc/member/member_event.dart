import 'package:equatable/equatable.dart';

abstract class MemberListEvent extends Equatable {
  const MemberListEvent();
}

class MemberListGetEvent extends MemberListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
