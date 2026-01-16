class Trip {
  String namaTrip;
  String tanggalMulai;
  String tanggalAkhir;

  Trip({
    required this.namaTrip,
    required this.tanggalMulai,
    required this.tanggalAkhir,
  });

  // Mengubah object Trip menjadi Map<String, dynamic>
  // Map ini nantinya bisa dikirim ke API/database sebagai JSON
  Map<String, dynamic> toJson() {
    return {
      'namaTrip': namaTrip,
      'tanggalMulai': tanggalMulai,
      'tanggalAkhir': tanggalAkhir,
    };
  }

  // Membuat object Trip baru dari data JSON (Map)
  // Biasanya dipakai saat menerima response dari API
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      namaTrip: json['namaTrip'],
      tanggalMulai: json['tanggalMulai'],
      tanggalAkhir: json['tanggalAkhir'],
    );
  }
}
