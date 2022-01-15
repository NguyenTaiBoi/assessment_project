class SurveyModel {
  final String name;
  final String code;
  final String scene;
  final String createAt;
  final String dueDate;
  final String status;
  final dynamic assessmentCategory;
  final dynamic phase;
  final dynamic manager;
  final dynamic customer;
  final double estimatePrice;
  final dynamic inspectors;

  const SurveyModel(
      {this.name,
      this.code,
      this.scene,
      this.createAt,
      this.dueDate,
      this.status,
      this.assessmentCategory,
      this.phase,
      this.manager,
      this.customer,
      this.estimatePrice,
      this.inspectors});

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
        name: json['name'] as String,
        code: json['code'] as String,
        scene: json['scene'] as String,
        createAt: json['createAt'] as String,
        dueDate: json['dueDate'] as String,
        status: json['status'] as String,
        assessmentCategory: json['assessmentCategory'] as dynamic,
        phase: json['phase'] as dynamic,
        manager: json['manager'] as dynamic,
        customer: json['customer'] as dynamic,
        estimatePrice: json['estimatePrice'] as dynamic,
        inspectors: json['inspectors'] as dynamic);
  }
}

class PutPhaseModel {
  final String content;
  final String phaseName;
  final String surveyCode;

  const PutPhaseModel({
    this.content,
    this.phaseName,
    this.surveyCode,
  });

  factory PutPhaseModel.fromJson(Map<String, dynamic> json) {
    return PutPhaseModel(
      content: json['content'] as String,
      phaseName: json['phaseName'] as String,
      surveyCode: json['surveyCode'] as String,
    );
  }
}
