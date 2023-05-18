library network;

import 'package:dio/dio.dart';
import 'package:demo/core/constants/globals.dart';
import 'package:demo/core/model/events/file_upload_progress_event.dart';
import 'package:demo/core/network/url_config.dart';
import 'dart:io';

import 'package:demo/core/utils/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo/core/utils/logger.dart';

part 'api_error.dart';
part 'app_interceptor.dart';
part 'network_provider.dart';