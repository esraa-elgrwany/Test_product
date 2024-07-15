import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/features/ProductTab/presentation/pages/ProductTab.dart';


import 'config/theming/myTheme.dart';
import 'core/utils/observer.dart';
import 'features/ProductTab/presentation/manager/product_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(412, 870),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) =>
                MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: ProductTab.routeName,
                  routes: {
                    ProductTab.routeName: (context) => ProductTab(),
                  },
                  theme: MyThemeData.lightTheme,
                  darkTheme: MyThemeData.darkTheme,
                ),
          );
        },
      ),
    );
  }
}
