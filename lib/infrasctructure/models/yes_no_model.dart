class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  // * name constructure and factory label

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);
}
