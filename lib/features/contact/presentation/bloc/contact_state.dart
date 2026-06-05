sealed class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {}

class ContactFailure extends ContactState {
  final String message;

  ContactFailure(this.message);
}