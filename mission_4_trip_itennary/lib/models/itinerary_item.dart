class ItineraryItem {
  String lokasi;
  String waktu;
  String catatan;
  String idTrip;

  ItineraryItem({
    required this.lokasi,
    required this.waktu,
    required this.catatan,
    required this.idTrip,
  });

  // Mengubah object ItineraryItem menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'lokasi': lokasi,
      'waktu': waktu,
      'catatan': catatan,
      'idTrip': idTrip,
    };
  }

  // Membuat object ItineraryItem dari JSON
  factory ItineraryItem.fromJson(Map<String, dynamic> json) {
    return ItineraryItem(
      lokasi: json['lokasi'],
      waktu: json['waktu'],
      catatan: json['catatan'],
      idTrip: json['idTrip'],
    );
  }
}
