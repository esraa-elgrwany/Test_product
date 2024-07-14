import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/features/ProductTab/presentation/manager/product_cubit.dart';
import '../widgets/Product_item.dart';

class ProductTab extends StatelessWidget {
  static const String routeName = "productTab";

  ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProductCubit()..getProducts(),
  child: BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ProductCubit.get(context).products.isEmpty
            ? Center(child: const CircularProgressIndicator())
            : Scaffold(
          appBar: AppBar(
            title: Image.asset("assets/images/Group 5.png"),
          ),
              body: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    TextFormField(
                                      controller:
                                          ProductCubit.get(context).searchController,
                                      decoration: InputDecoration(
                                        fillColor: Color(0xFFDEE2E7).withOpacity(.3),
                                        filled: true,
                                        hintText: "Search",
                                        hintStyle:
                                            Theme.of(context).textTheme.bodyMedium,
                                        prefixIcon: IconButton(
                                          onPressed: () {
                                            ProductCubit.get(context).getProducts(
                                               );
                                          },
                                          icon: Icon(
                                            Icons.search_sharp,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDEE2E7),
                                            ),
                                            borderRadius: BorderRadius.circular(8.r)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDEE2E7),
                                          ),
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                      ),
                                    ),
                                    IconButton(onPressed: () {

                                    }, icon:Image.asset("assets/images/🦆 icon _shopping cart_.png"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 280.h,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height - 652.h,
                              crossAxisCount: 2,
                            ),
                            itemCount: ProductCubit.get(context).products.length,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w,
                              vertical: 24.0.h,
                            ),
                            itemBuilder: (context, index) {
                              return ProductListItem(
                                  ProductCubit.get(context).products[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            );
      },
    ),
);
  }
}
