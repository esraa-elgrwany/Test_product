import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/utils/app_colors.dart';
import 'package:test_task/features/ProductTab/presentation/manager/product_cubit.dart';
import '../widgets/Product_item.dart';

class ProductTab extends StatelessWidget {
  static const String routeName = "productTab";

  ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ProductCubit.get(context).products.isEmpty
              ? Center(child: const CircularProgressIndicator())
              : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Image.asset("assets/images/Group 5.png"),
            ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    ProductCubit.get(context).searchController,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "What do you search for",
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: secondColor.withOpacity(.4)
                                      ),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      ProductCubit.get(context).getProducts(
                                         );
                                    },
                                    icon: Icon(
                                      Icons.search_sharp,
                                      color:primaryColor,
                                      size: 25,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(30.r)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(onPressed: () {

                            }, icon:Image.asset("assets/images/🦆 icon _shopping cart_.png"))
                          ],
                        ),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height -180.h,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height - 645.h,
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
              );
        },
      );
  }
}
