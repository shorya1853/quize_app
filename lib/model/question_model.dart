class QuestionModel {
  QuestionModel(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> answershuffel (){
    final shuffeled = List.of(answer);   
    shuffeled.shuffle();
    return shuffeled;
  }
}