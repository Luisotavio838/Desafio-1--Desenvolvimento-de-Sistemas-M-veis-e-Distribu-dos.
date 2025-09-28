import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/shared/storage/hive_storage.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/model/address_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AddressModelAdapter()); // gerado pelo hive_generator
  await HiveStorage.init(); // abrir boxes
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
