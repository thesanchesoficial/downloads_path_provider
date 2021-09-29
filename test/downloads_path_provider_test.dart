import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';

void main() {
  const MethodChannel channel = MethodChannel('downloads_path_provider');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DownloadsPathProvider.downloadsDirectory, '42');
  });
}
