import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class Info {
  const Info({
    required this.count,
    required this.pages,
    // required this.next,
    // required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);

  final int count;
  final int pages;
  // final String next;
  // final String prev;
}
