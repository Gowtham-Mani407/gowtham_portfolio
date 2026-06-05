
abstract class ContactEvent {}

class SendContactMessage extends ContactEvent {
  final String name;
  final String email;
  final String mobilenum;
  final String subject;
  final String message;

  SendContactMessage({
    required this.name,
    required this.email,
    required this.mobilenum,
    required this.subject,
    required this.message,
  });
}