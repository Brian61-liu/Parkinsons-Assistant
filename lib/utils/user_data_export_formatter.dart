/// Formats GDPR export payload as CSV text (RFC 4180-ish).
/// Raw accelerometer samples are summarized as [sensorSampleCount] only.
class UserDataExportFormatter {
  UserDataExportFormatter._();

  /// Builds one multi-section CSV document suitable for Numbers / Excel.
  static String toCsv(Map<String, dynamic> data) {
    final buf = StringBuffer();

    buf.writeln('# Amplio Data Export - Meta');
    buf.writeln(_csvRow(['key', 'value']));
    buf.writeln(_csvRow(['exportedAt', _cell(data['exportedAt'])]));
    buf.writeln(_csvRow(['userId', _cell(data['userId'])]));
    buf.writeln(_csvRow(['email', _cell(data['email'])]));

    final sources = data['sources'];
    if (sources is Map) {
      buf.writeln(
        _csvRow(['tremorSource', _cell(sources['tremorRecords'])]),
      );
      buf.writeln(
        _csvRow([
          'movementSource',
          _cell(sources['movementTrainingRecords']),
        ]),
      );
    }
    buf.writeln(_csvRow(['note', _cell(data['note'])]));

    buf.writeln();
    buf.writeln('# Profile');
    buf.writeln(_csvRow(['field', 'value']));
    final profile = data['profile'];
    if (profile is Map && profile.isNotEmpty) {
      final keys = profile.keys.map((k) => k.toString()).toList()..sort();
      for (final key in keys) {
        buf.writeln(_csvRow([key, _cell(profile[key])]));
      }
    }

    buf.writeln();
    buf.writeln('# Tremor Records');
    buf.writeln(
      _csvRow(const [
        'id',
        'timestamp',
        'averageFrequency_Hz',
        'maxAmplitude',
        'averageAmplitude',
        'duration_sec',
        'sensorSampleCount',
      ]),
    );
    for (final r in _asMapList(data['tremorRecords'])) {
      buf.writeln(
        _csvRow([
          _cell(r['id']),
          _cell(r['timestamp']),
          _cell(r['averageFrequency']),
          _cell(r['maxAmplitude']),
          _cell(r['averageAmplitude']),
          _cell(r['duration']),
          _sensorSampleCount(r['accelerometerData']).toString(),
        ]),
      );
    }

    buf.writeln();
    buf.writeln('# Movement Training Records');
    buf.writeln(
      _csvRow(const [
        'id',
        'timestamp',
        'duration_sec',
        'successCount',
        'targetCount',
        'goalReached',
        'trainingType',
      ]),
    );
    for (final r in _asMapList(data['movementTrainingRecords'])) {
      buf.writeln(
        _csvRow([
          _cell(r['id']),
          _cell(r['timestamp']),
          _cell(r['duration']),
          _cell(r['successCount']),
          _cell(r['targetCount']),
          _cell(r['goalReached']),
          _cell(r['trainingType']),
        ]),
      );
    }

    return buf.toString();
  }

  /// @Deprecated Prefer [toCsv]. Kept for any callers still using TSV.
  static String toTabularText(Map<String, dynamic> data) => toCsv(data);

  static List<Map<String, dynamic>> _asMapList(dynamic value) {
    if (value is! List) return const [];
    return value
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  static String _csvRow(List<String> cells) => cells.map(_escapeCsv).join(',');

  static String _cell(dynamic value) {
    if (value == null) return '';
    if (value is bool) return value ? 'true' : 'false';
    if (value is num) return value.toString();
    if (value is String) return value;
    return value.toString();
  }

  static String _escapeCsv(String raw) {
    final needsQuotes = raw.contains(',') ||
        raw.contains('"') ||
        raw.contains('\n') ||
        raw.contains('\r');
    final escaped = raw.replaceAll('"', '""');
    return needsQuotes ? '"$escaped"' : escaped;
  }

  /// Cloud stores a list; local SQLite stores a comma-joined string.
  static int _sensorSampleCount(dynamic accelerometerData) {
    if (accelerometerData == null) return 0;
    if (accelerometerData is List) return accelerometerData.length;
    if (accelerometerData is String) {
      final s = accelerometerData.trim();
      if (s.isEmpty) return 0;
      return s.split(',').where((e) => e.trim().isNotEmpty).length;
    }
    return 0;
  }
}
