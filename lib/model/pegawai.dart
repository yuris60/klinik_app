class Pegawai {
  String? id;
  String nipPegawai;
  String namaPegawai;
  String tgllhrPegawai;
  String telpPegawai;
  String emailPegawai;
  String passwordPegawai;

  Pegawai({this.id, required this.namaPegawai, required this.nipPegawai, required this.tgllhrPegawai, required this.telpPegawai, required this.emailPegawai, required this.passwordPegawai});

  factory Pegawai.fromJson(Map<String, dynamic> json) =>
      Pegawai(id: json["id"], nipPegawai: json["nip"], namaPegawai: json["nama"], tgllhrPegawai: json["tanggal_lahir"], telpPegawai: json["nomor_telepon"], emailPegawai: json["email"], passwordPegawai: json["password"] );

  Map<String, dynamic> toJson() => {"nip": nipPegawai, "nama": namaPegawai, "tanggal_lahir": tgllhrPegawai, "nomor_telepon": telpPegawai, "email": emailPegawai, "password": passwordPegawai};
}