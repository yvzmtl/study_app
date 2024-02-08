// class AnswerModel {
//   String? identifier;
//   String? answer;

//   AnswerModel({
//     this.identifier, 
//     this.answer});

//   AnswerModel.fromJson(Map<String, dynamic> json){
//     identifier = json["identifier"];
//     answer = json["Answer"];
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String? id;
  String? title;
  String? image_url;
  String? description;
  int? timeSeconds;
  late List<Questions> questions;
  int? questions_count;

  QuestionPaperModel(
      {this.id,
      this.title,
      this.image_url,
      this.description,
      this.timeSeconds,
      required this.questions,
      this.questions_count});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    image_url = json['image_url'] as String;
    description = json['description'] as String;
    timeSeconds = json['time_seconds'];
    questions_count = 0;
    // questions = (json["questions"] as List).map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>)).toList();
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions.add(Questions.fromJson(v));
      });
    }
  }

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) {
    // id = json['id'] as String;
    id = json.id;
    title = json['title'];
    image_url = json['image_url'];
    description = json['description'];
    timeSeconds = json['time_seconds'];
    questions_count = json['questions_count'] as int;
    // questions = (json["questions"] as List).map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>)).toList();
    questions = [];

    //String timeInMinits() => "${}"
  }
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.image_url;
    data['description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    return data;
  }
  }
  


class Questions {
  String? id;
  String? question;
  late List<Answers> answers;
  String? correctAnswer;

  Questions({this.id, this.question,required this.answers, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    // answers = (json["answer"] as List).map((dynamic e ) => Answers.fromJson(e as Map<String, dynamic>)).toList();
    if (json['answers'] != null) {
      // answers = new List<Answers>();
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers.add(Answers.fromJson(v));
      });
    }    
    correctAnswer = json['correct_answer'];
  }

    // Questions.fromJson(Map<String, dynamic> json) :
    // id = json['id'],
    // question = json['question'],
    // answers = (json["answer"] as List).map((e) => Answers.fromJson(e)).toList(),  
    // correctAnswer = json['correct_answer'];
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    answer = json['answer'];
  }

    // Answers.fromJson(Map<String, dynamic> json) :
    // identifier = json['identifier'],
    // answer = json['Answer'];
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['answer'] = this.answer;
    return data;
  }
}