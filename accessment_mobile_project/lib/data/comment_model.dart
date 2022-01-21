class CommentModel {
  final String title;
  final String content;
  final dynamic user;
  final dynamic confirmations;
  final int id;

  const CommentModel(
      {this.user, this.content, this.title, this.confirmations, this.id});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      user: json['user'] as dynamic,
      confirmations: json['confirmations'] as dynamic,
    );
  }
}

class PostCommentModel {
  final String surveyCode;
  final String content;
  final List<String> confirmedUser;

  const PostCommentModel({this.surveyCode, this.content, this.confirmedUser});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyCode'] = this.surveyCode;
    data['content'] = this.content;
    data['confirmedUser'] = this.confirmedUser;
    return data;
  }
}
