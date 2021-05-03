import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group(
    'Test Blog App',
      (){
        FlutterDriver flutterDriver;
        setUpAll(() async{
          flutterDriver = await FlutterDriver.connect();
        });

        tearDownAll(() async {
          await flutterDriver?.close();
        });

        test('Verify health of Flutter driver', () async {
          final Health health = await flutterDriver.checkHealth();
          expect(health.status, equals(HealthStatus.ok));
        });

        test('Dashboard List View', () async {

        });
      }
  );
}