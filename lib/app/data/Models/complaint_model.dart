import 'dart:convert';

class ComplaintModel {
  String? complaint_id;
  String? emp_id;

  final String subject;
  final String description;
  final String complainant;
  final DateTime created_at;
  final String? department;

  final String status;
  ComplaintModel({
    this.complaint_id,
    this.emp_id,
    required this.subject,
    required this.description,
    required this.complainant,
    required this.created_at,
    this.department,
    required this.status,
  });

  ComplaintModel copyWith({
    String? complaint_id,
    String? emp_id,
    String? subject,
    String? description,
    String? complainant,
    DateTime? created_at,
    String? department,
    String? status,
  }) {
    return ComplaintModel(
      complaint_id: complaint_id ?? this.complaint_id,
      emp_id: emp_id ?? this.emp_id,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      complainant: complainant ?? this.complainant,
      created_at: created_at ?? this.created_at,
      department: department ?? this.department,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'complaint_id': complaint_id,
      'emp_id': emp_id,
      'subject': subject,
      'description': description,
      'complainant': complainant,
      'created_at': created_at.millisecondsSinceEpoch,
      'department': department,
      'status': status,
    };
  }

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      complaint_id: map['complaint_id'],
      emp_id: map['emp_id'],
      subject: map['subject'] ?? '',
      description: map['description'] ?? '',
      complainant: map['complainant'] ?? '',
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      department: map['department'],
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplaintModel.fromJson(String source) =>
      ComplaintModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ComplaintModel(complaint_id: $complaint_id, emp_id: $emp_id, subject: $subject, description: $description, complainant: $complainant, created_at: $created_at, department: $department, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComplaintModel &&
        other.complaint_id == complaint_id &&
        other.emp_id == emp_id &&
        other.subject == subject &&
        other.description == description &&
        other.complainant == complainant &&
        other.created_at == created_at &&
        other.department == department &&
        other.status == status;
  }

  @override
  int get hashCode {
    return complaint_id.hashCode ^
        emp_id.hashCode ^
        subject.hashCode ^
        description.hashCode ^
        complainant.hashCode ^
        created_at.hashCode ^
        department.hashCode ^
        status.hashCode;
  }
}
