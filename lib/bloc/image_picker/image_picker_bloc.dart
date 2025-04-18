import 'package:bloc_study/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_study/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_study/utils/Image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraPicker>(_cameraPicker);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  _cameraPicker(CameraPicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  _galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit, ) async {
    XFile? file = await imagePickerUtils.galleryImage();
    emit(state.copyWith(file: file));
  }
}
