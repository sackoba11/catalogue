// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
class StatutLienAdapter extends TypeAdapter<StatutLien> {
  @override
  final typeId = 2;

  @override
  StatutLien read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatutLien.Public;
      case 1:
        return StatutLien.Prive;
      default:
        return StatutLien.Public;
    }
  }

  @override
  void write(BinaryWriter writer, StatutLien obj) {
    switch (obj) {
      case StatutLien.Public:
        writer.writeByte(0);
        break;
      case StatutLien.Prive:
        writer.writeByte(1);
        break;
    }
  }
}

class RelationshipAdapter extends TypeAdapter<Relationship> {
  @override
  final typeId = 1;

  @override
  Relationship read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Relationship.Liens_Web;
      case 1:
        return Relationship.Page_Facebook;
      case 2:
        return Relationship.Page_Instagram;
      case 3:
        return Relationship.Page_Tiktok;
      case 4:
        return Relationship.Page_Twitter;
      case 5:
        return Relationship.Autres;
      default:
        return Relationship.Liens_Web;
    }
  }

  @override
  void write(BinaryWriter writer, Relationship obj) {
    switch (obj) {
      case Relationship.Liens_Web:
        writer.writeByte(0);
        break;
      case Relationship.Page_Facebook:
        writer.writeByte(1);
        break;
      case Relationship.Page_Instagram:
        writer.writeByte(2);
        break;
      case Relationship.Page_Tiktok:
        writer.writeByte(3);
        break;
      case Relationship.Page_Twitter:
        writer.writeByte(4);
        break;
      case Relationship.Autres:
        writer.writeByte(5);
        break;
    }
  }
}

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      fields[0] as String,
      fields[1] as String,
      fields[3] as String,
      fields[2] as Relationship,
      fields[4] as StatutLien,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.typeLiens)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.statut);
  }
}
