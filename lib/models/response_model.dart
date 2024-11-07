class ResponseModel {
  final bool isSuccess;
  final dynamic data;
  final String message;

  ResponseModel({
    required this.isSuccess,
    this.data,
    required this.message,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      isSuccess: json.containsKey('success') ? json['success'] : true,
      data: json['data'],
      message: json['message'] ?? "Success",
    );
  }
  
}
