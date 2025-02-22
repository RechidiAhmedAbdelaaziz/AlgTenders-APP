import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tender_app/core/network/models/api_response.model.dart';

class CategoryCache {
  Future<PaginatedDataResponse> loadCategories() async {
    String jsonString = await rootBundle.loadString(
      'assets/data/categories.json',
    );
    final jsonData = json.decode(jsonString);
    return PaginatedDataResponse.fromJson(jsonData);
  }
}
