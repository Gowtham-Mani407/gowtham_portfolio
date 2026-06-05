import 'package:cloud_firestore/cloud_firestore.dart';

class PortfolioService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> getResumeUrl() async {
    final doc = await firestore.collection('portfolio').doc('resume').get();

    return doc['resume_url'];
  }

  Future<String> getResumedowloadUrl() async {
    final doc = await firestore.collection('portfolio').doc('resume').get();

    return doc['resume_download'];
  }
}
