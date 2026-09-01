class UmkmModel {
  final String? id;
  final String nama;
  final String kategori;
  final double latitude;
  final double longitude;

  UmkmModel({
    this.id,
    required this.nama,
    required this.kategori,
    required this.latitude,
    required this.longitude,
  });

  factory UmkmModel.fromFirestore(Map<String, dynamic> json, String docId) {
    return UmkmModel(
      id: docId,
      nama: json['nama'] ?? '',
      kategori: json['kategori'] ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  // Mengubah Object Dart menjadi Map untuk disimpan ke Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'nama': nama,
      'kategori': kategori,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
