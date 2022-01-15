class ConfirmationModel {
  final bool status;
  final dynamic user;

  const ConfirmationModel({
    this.status,
    this.user,
  });

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) {
    return ConfirmationModel(
      status: json['status'] as bool,
      user: json['user'] as dynamic,
    );
  }
}
