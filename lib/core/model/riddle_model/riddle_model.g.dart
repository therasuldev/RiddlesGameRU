// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riddle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RiddleModelAdapter extends TypeAdapter<RiddleModel> {
  @override
  final int typeId = 0;

  @override
  RiddleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RiddleModel(
      riddle: fields[0] as String,
      answer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RiddleModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.riddle)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RiddleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
