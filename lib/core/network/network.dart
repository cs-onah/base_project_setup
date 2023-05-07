library network;

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:swiftsell/core/constants/globals.dart';
import 'package:swiftsell/core/model/events/file_upload_progress_event.dart';
import 'package:swiftsell/core/network/url_config.dart';
import 'dart:io';

import 'package:swiftsell/core/utils/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiftsell/core/utils/logger.dart';

part 'api_error.dart';
part 'app_interceptor.dart';
part 'network_provider.dart';