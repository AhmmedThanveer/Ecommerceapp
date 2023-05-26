// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Hivemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class userAdapter extends TypeAdapter<user> {
  @override
  final int typeId = 1;

  @override
  user read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return user(
      brand: fields[0] as String,
      image: fields[2] as String,
      price: fields[1] as int,
      name: fields[3] as String,
      notes: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, user obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.brand)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is userAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
