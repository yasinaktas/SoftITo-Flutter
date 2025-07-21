// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ogrenci.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OgrenciAdapter extends TypeAdapter<Ogrenci> {
  @override
  final int typeId = 1;

  @override
  Ogrenci read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ogrenci(
      id: fields[0] as int,
      ad: fields[1] == null ? 'unknown' : fields[1] as String,
      soyad: fields[2] == null ? 'unknown' : fields[2] as String,
      gozRengi: fields[3] == null ? GozRenk.kahverengi : fields[3] as GozRenk,
      yas: fields[4] == null ? 0 : fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ogrenci obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ad)
      ..writeByte(2)
      ..write(obj.soyad)
      ..writeByte(3)
      ..write(obj.gozRengi)
      ..writeByte(4)
      ..write(obj.yas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OgrenciAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GozRenkAdapter extends TypeAdapter<GozRenk> {
  @override
  final int typeId = 2;

  @override
  GozRenk read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GozRenk.siyah;
      case 1:
        return GozRenk.kahverengi;
      case 2:
        return GozRenk.yesil;
      case 3:
        return GozRenk.mavi;
      case 4:
        return GozRenk.ela;
      default:
        return GozRenk.siyah;
    }
  }

  @override
  void write(BinaryWriter writer, GozRenk obj) {
    switch (obj) {
      case GozRenk.siyah:
        writer.writeByte(0);
        break;
      case GozRenk.kahverengi:
        writer.writeByte(1);
        break;
      case GozRenk.yesil:
        writer.writeByte(2);
        break;
      case GozRenk.mavi:
        writer.writeByte(3);
        break;
      case GozRenk.ela:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GozRenkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
