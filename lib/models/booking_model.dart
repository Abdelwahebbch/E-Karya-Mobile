import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String id;
  final String propertyId;
  final String tenantId;
  final String landlordId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuests;
  final double totalPrice;
  final double depositAmount;
  final String status; // pending, confirmed, cancelled, completed
  final String paymentStatus; // pending, completed, failed
  final String paymentMethod;
  final String? transactionId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? propertyTitle;
  final String? tenantName;
  final String? tenantImage;

  const Booking({
    required this.id,
    required this.propertyId,
    required this.tenantId,
    required this.landlordId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuests,
    required this.totalPrice,
    required this.depositAmount,
    required this.status,
    required this.paymentStatus,
    required this.paymentMethod,
    this.transactionId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.propertyTitle,
    this.tenantName,
    this.tenantImage,
  });

  int get numberOfNights => checkOutDate.difference(checkInDate).inDays;

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      propertyId: json['propertyId'] as String,
      tenantId: json['tenantId'] as String,
      landlordId: json['landlordId'] as String,
      checkInDate: DateTime.parse(json['checkInDate'] as String),
      checkOutDate: DateTime.parse(json['checkOutDate'] as String),
      numberOfGuests: json['numberOfGuests'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      depositAmount: (json['depositAmount'] as num).toDouble(),
      status: json['status'] as String,
      paymentStatus: json['paymentStatus'] as String,
      paymentMethod: json['paymentMethod'] as String,
      transactionId: json['transactionId'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      propertyTitle: json['propertyTitle'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantImage: json['tenantImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyId': propertyId,
      'tenantId': tenantId,
      'landlordId': landlordId,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'numberOfGuests': numberOfGuests,
      'totalPrice': totalPrice,
      'depositAmount': depositAmount,
      'status': status,
      'paymentStatus': paymentStatus,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'propertyTitle': propertyTitle,
      'tenantName': tenantName,
      'tenantImage': tenantImage,
    };
  }

  Booking copyWith({
    String? id,
    String? propertyId,
    String? tenantId,
    String? landlordId,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? numberOfGuests,
    double? totalPrice,
    double? depositAmount,
    String? status,
    String? paymentStatus,
    String? paymentMethod,
    String? transactionId,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? propertyTitle,
    String? tenantName,
    String? tenantImage,
  }) {
    return Booking(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      tenantId: tenantId ?? this.tenantId,
      landlordId: landlordId ?? this.landlordId,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      totalPrice: totalPrice ?? this.totalPrice,
      depositAmount: depositAmount ?? this.depositAmount,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionId: transactionId ?? this.transactionId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      propertyTitle: propertyTitle ?? this.propertyTitle,
      tenantName: tenantName ?? this.tenantName,
      tenantImage: tenantImage ?? this.tenantImage,
    );
  }

  @override
  List<Object?> get props => [
        id,
        propertyId,
        tenantId,
        landlordId,
        checkInDate,
        checkOutDate,
        numberOfGuests,
        totalPrice,
        depositAmount,
        status,
        paymentStatus,
        paymentMethod,
        transactionId,
        notes,
        createdAt,
        updatedAt,
        propertyTitle,
        tenantName,
        tenantImage,
      ];
}
