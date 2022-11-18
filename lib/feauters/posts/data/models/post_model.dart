import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});

  // from json
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
