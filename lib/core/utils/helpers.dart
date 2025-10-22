import 'package:flutter/material.dart';

ImageProvider providerFromPath(String path) {
  return path.startsWith('http') ? NetworkImage(path) : AssetImage(path) as ImageProvider;
}
