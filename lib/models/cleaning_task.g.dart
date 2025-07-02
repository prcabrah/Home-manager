// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleaning_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CleaningTaskAdapter extends TypeAdapter<CleaningTask> {
  @override
  final int typeId = 1;

  @override
  CleaningTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CleaningTask(
      task: fields[0] as String,
      assignedTo: fields[1] as String,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CleaningTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.assignedTo)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CleaningTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
