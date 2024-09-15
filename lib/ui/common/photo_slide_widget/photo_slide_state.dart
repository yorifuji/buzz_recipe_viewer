import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_slide_state.freezed.dart';

@freezed
class PhotoSlideState with _$PhotoSlideState {
  const factory PhotoSlideState({
    @Default([]) List<String> urls,
    @Default([]) List<XFile> files,
  }) = _PhotoSlideState;
  const PhotoSlideState._();

  int get totalCount => urls.length + files.length;

  bool isUrlAtIndex(int index) => index < urls.length;

  ImageProvider getImageProviderAtIndex(int index) => isUrlAtIndex(index)
      ? NetworkImage(urls[index])
      : FileImage(File(files[index - urls.length].path));
}
