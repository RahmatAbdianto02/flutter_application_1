class GempaTerkiniModel {
  final String tanggal;
  final String jam;
  final String dateTime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;
  final String shakemap;

  GempaTerkiniModel({
    required this.tanggal,
    required this.jam,
    required this.dateTime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakemap,
  });

  factory GempaTerkiniModel.fromJson(Map<String, dynamic> json) {
    return GempaTerkiniModel(
      tanggal: json['Tanggal'] as String,
      jam: json['Jam'] as String,
      dateTime: json['DateTime'] as String,
      coordinates: json['Coordinates'] as String,
      lintang: json['Lintang'] as String,
      bujur: json['Bujur'] as String,
      magnitude: json['Magnitude'] as String,
      kedalaman: json['Kedalaman'] as String,
      wilayah: json['Wilayah'] as String,
      potensi: json['Potensi'] as String,
      dirasakan: json['Dirasakan'] as String,
      shakemap: json['Shakemap'] as String,
    );
  }
}
