class ProductServicesExceptions implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  ProductServicesExceptions(
      {required this.message, this.devDetails, this.prettyDetails});

  @override
  String toString() {
    return 'ProductServicesExceptions: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
