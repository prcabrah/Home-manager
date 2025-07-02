// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookingTaskAdapter extends TypeAdapter<CookingTask> {
  @override
  final int typeId = 0;

  @override
  CookingTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookingTask(
      day: fields[0] as String,
      meal: fields[1] as String,
      cost: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CookingTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.meal)
      ..writeByte(2)
      ..write(obj.cost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookingTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
