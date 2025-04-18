import 'package:equatable/equatable.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object?> get props => [];
}


class CameraPicker extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}