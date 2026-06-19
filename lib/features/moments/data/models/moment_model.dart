import '../../domain/entities/moment_entity.dart';

class MomentModel extends MomentEntity {
  const MomentModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory MomentModel.fromJson(Map<String, dynamic> json) {
    final title = json['title']?.toString() ??
        json['full_name']?.toString() ??
        json['tenant_code']?.toString() ??
        '-';
    final description = json['body']?.toString() ??
        json['description']?.toString() ??
        json['email']?.toString() ??
        '';

    return MomentModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: title,
      description: description,
    );
  }
}
