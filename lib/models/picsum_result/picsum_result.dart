import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class PicsumResult {
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  final String? downloadUrl;

  const PicsumResult({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  @override
  String toString() {
    return 'PicsumResult(id: $id, author: $author, width: $width, height: $height, url: $url, downloadUrl: $downloadUrl)';
  }

  factory PicsumResult.fromMap(Map<String, dynamic> data) => PicsumResult(
        id: data['id'] as String?,
        author: data['author'] as String?,
        width: data['width'] as int?,
        height: data['height'] as int?,
        url: data['url'] as String?,
        downloadUrl: data['download_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'author': author,
        'width': width,
        'height': height,
        'url': url,
        'download_url': downloadUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PicsumResult].
  factory PicsumResult.fromJson(String data) {
    return PicsumResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PicsumResult] to a JSON string.
  String toJson() => json.encode(toMap());
}
