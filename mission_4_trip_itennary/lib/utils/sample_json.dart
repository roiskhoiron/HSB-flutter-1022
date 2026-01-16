// File ini berisi CONTOH DATA JSON MURNI
// Tujuannya agar bisa melihat:
// 1. Bentuk JSON yang biasanya datang dari API/database
// 2. Data ini nanti bisa dipakai untuk fromJson()

class SampleJson {
  // Contoh JSON Trip (biasanya hasil response API)
  static Map<String, dynamic> tripJson = {
    "namaTrip": "LIBURAN JEPANG 2026",
    "tanggalMulai": "12 Januari 2026",
    "tanggalAkhir": "28 Januari 2026",
  };

  // Contoh JSON ItineraryItem
  static Map<String, dynamic> itineraryJson = {
    "lokasi": "KYOTO",
    "waktu": "JAM 8 MALAM",
    "catatan": "Coba ramen ichiraku dekat rumah Masashi Kishimoto",
    "idTrip": "1022",
  };
}
