// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseItemAdapter extends TypeAdapter<PurchaseItem> {
  @override
  final int typeId = 2;

  @override
  PurchaseItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseItem(
      name: fields[0] as String,
      price: fields[1] as double,
      bought: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.bought);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
