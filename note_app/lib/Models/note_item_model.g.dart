// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteItemModelAdapter extends TypeAdapter<NoteItemModel> {
  @override
  final int typeId = 0;

  @override
  NoteItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteItemModel(
      title: fields[0] as String,
      content: fields[1] as String,
      date: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NoteItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
