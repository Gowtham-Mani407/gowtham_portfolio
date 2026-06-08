import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowtham_portfolio/features/contact/data/repositories/contact_repository.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_event.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository repository;
  final EmailService emailService;

  ContactBloc(this.repository, this.emailService) : super(ContactInitial()) {
    on<SendContactMessage>(_sendContactMessage);
  }

  Future<void> _sendContactMessage(
    SendContactMessage event,
    Emitter<ContactState> emit,
  ) async {
    emit(ContactLoading());

    try {
      await repository.sendTelegramMessage(
        name: event.name,
        email: event.email,
        mobilenum: event.mobilenum,
        subject: event.subject,
        message: event.message,
      );

      await emailService.sendEmail(
        name: event.name,
        email: event.email,
        mobilenum: event.mobilenum,
        subject: event.subject,
        message: event.message,
      );


      emit(ContactSuccess());
    } catch (e) {
      emit(ContactFailure(e.toString()));
    }
  }
}
