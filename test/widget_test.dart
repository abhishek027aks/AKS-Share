import 'package:aks_share/app/app.dart';
import 'package:aks_share/features/devices/provider/device_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('AKS Share dashboard renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => DeviceProvider(),
        child: const AKSShareApp(),
      ),
    );

    expect(find.text('Welcome to AKS Share'), findsOneWidget);
    expect(find.text('Quick Actions'), findsOneWidget);
  });
}
