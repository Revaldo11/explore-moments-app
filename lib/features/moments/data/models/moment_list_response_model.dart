import 'moment_model.dart';

class MomentListResponseModel {
  const MomentListResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<MomentData> data;

  factory MomentListResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return MomentListResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message']?.toString() ?? '',
      data: rawData is List<dynamic>
          ? rawData
              .whereType<Map<String, dynamic>>()
              .map(MomentData.fromJson)
              .toList(growable: false)
          : const [],
    );
  }
}

class MomentData {
  const MomentData({
    required this.id,
    required this.tenantCode,
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final String tenantCode;
  final int userId;
  final String fullName;
  final String phoneNumber;
  final String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory MomentData.fromJson(Map<String, dynamic> json) {
    return MomentData(
      id: (json['id'] as num?)?.toInt() ?? 0,
      tenantCode: json['tenant_code']?.toString() ?? '',
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      fullName: json['full_name']?.toString() ?? '-',
      phoneNumber: json['phone_number']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at']?.toString() ?? ''),
    );
  }

  MomentModel toMomentModel() {
    return MomentModel(
      id: id,
      title: fullName.isEmpty ? tenantCode : fullName,
      description: email,
    );
  }
}
