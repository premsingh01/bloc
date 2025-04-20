import 'dart:io';

import 'package:bloc_study/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_study/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_study/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_study/utils/Image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker")),
      body: BlocProvider(
        create: (context) => ImagePickerBloc(ImagePickerUtils()),
        child: ListView(
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraPicker());
                        },
                        child: const CircleAvatar(child: Icon(Icons.camera)),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(GalleryImagePicker());
                        },
                        child: const CircleAvatar(child: Icon(Icons.browse_gallery)),
                      ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      
                  if (state.file != null)
                  Image.file(File(state.file!.path.toString())),
                    ],
                  );
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
