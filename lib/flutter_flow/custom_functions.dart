import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

dynamic newCustomFunction(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic newCustomFunction2(dynamic prompt) {
  return json.decode('{"role": "user", "content": "$prompt"}');
}
