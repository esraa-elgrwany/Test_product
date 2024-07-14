import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/utils/app_colors.dart';
import 'package:test_task/features/ProductTab/presentation/manager/product_cubit.dart';

import '../../data/models/ProductModel.dart';

class ProductListItem extends StatefulWidget {
  ProductData item;

  ProductListItem(this.item);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
          height: 170.h,
          width: 191.w,
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                    child: Image.network(
                      widget.item.images?[0] ?? "",
                      height: 138.h,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.item.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                ),
                        Text(widget.item.description ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            Text("EGP",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "${widget.item.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            Text('Review (${widget.item.rating})',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    fontSize: 12.sp)),
                            SizedBox(
                              width: 4.w,
                            ),
                            Icon(
                              Icons.star,
                              color: const Color(0xffFDD835),
                              size: 25.h,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 14.r,
                                backgroundColor: primaryColor,
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: ImageIcon(
                            AssetImage("assets/images/Vector.png"),
                            //color: Colors.blue,
                          ),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
