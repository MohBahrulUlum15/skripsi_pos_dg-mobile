import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
    final bool? success;
    final String? message;
    final Data? data;
    final String? token;

    AuthResponseModel({
        this.success,
        this.message,
        this.data,
        this.token,
    });

    factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "token": token,
    };
}

class Data {
    final int? id;
    final String? name;
    final String? email;
    final String? phone;
    final String? roles;
    final String? kodeNikNip;
    final DateTime? tanggalLahir;
    final String? alamat;

    Data({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.roles,
        this.kodeNikNip,
        this.tanggalLahir,
        this.alamat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
        kodeNikNip: json["kode_nik_nip"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        alamat: json["alamat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
        "kode_nik_nip": kodeNikNip,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "alamat": alamat,
    };
}
