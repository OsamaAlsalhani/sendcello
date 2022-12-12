import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/core/view&model/cart_viewmodel.dart';
import 'package:supercellostore/model/cart_model.dart';
import 'package:supercellostore/model/selected_model.dart';
import 'package:supercellostore/view/open_image.dart';
import '../model/product_model.dart';
import 'widgets/custom_text.dart';

class ProductDetailView extends StatefulWidget {
  final ProductModel _productModel;

  const ProductDetailView(this._productModel, {Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  List<SelectedModel> selectedProduct = [];
  List<SelectedModel> unSelectedProduct = [];
  CartViewModel controller = Get.find<CartViewModel>();
  addtocart(List<SelectedModel> selectedProduct) {
    for (var i = 0; i < selectedProduct.length; i++) {
      controller.addProduct(
        CartModel(
          name: widget._productModel.name,
          image: selectedProduct[i].image,
          price: widget._productModel.price,
          productId: widget._productModel.productId,
        ),
      );
    }
    if (selectedProduct.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت أضافة الى سلة المشتريات ')),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    addtolist(widget._productModel, unSelectedProduct);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () {
          addtocart(selectedProduct);
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 20,
                      color: Colors.black54,
                    )
                  ],
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: widget._productModel.name,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: widget._productModel.description,
                      fontSize: 18,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          text: '${widget._productModel.price} S.P',
                          fontSize: 18,
                          alignment: Alignment.bottomCenter,
                        ),
                        SizedBox(width: 10.w),
                        const CustomText(
                          text: 'السعر',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget._productModel.imageSlider.length,
                itemBuilder: (context, index) => item(
                  unSelectedProduct[index].image,
                  unSelectedProduct[index].isSelected,
                  index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(String image, bool isSelected, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => OpenImageScreen(imageSlid: image));
            },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 25,
                    color: Colors.black54,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: image,
                  child: Image.network(
                    height: 200.h,
                    width: 200.w,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            setState(() {
              unSelectedProduct[index].isSelected =
                  !unSelectedProduct[index].isSelected;
              if (unSelectedProduct[index].isSelected == true) {
                selectedProduct.add(SelectedModel(image, isSelected));
              } else if (unSelectedProduct[index].isSelected == false) {
                selectedProduct.removeWhere((element) =>
                    element.image == unSelectedProduct[index].image);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isSelected
                ? const Icon(
                    size: 50,
                    Icons.check_circle,
                    color: Colors.amber,
                  )
                : const Icon(
                    size: 50,
                    Icons.check_circle,
                    color: Colors.grey,
                  ),
          ),
        )
      ],
    );
    /*SizedBox(
      height: 200.h,
      child: ListTile(
        leading: SizedBox(
          height: 200.h,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        trailing: isSelected
            ? const Icon(
                Icons.check_circle,
                color: Colors.amber,
              )
            : const Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
        onTap: () {
          setState(() {
            unSelectedProduct[index].isSelected =
                !unSelectedProduct[index].isSelected;
            if (unSelectedProduct[index].isSelected == true) {
              selectedProduct.add(SelectedModel(image, isSelected));
            } else if (unSelectedProduct[index].isSelected == false) {
              selectedProduct.removeWhere(
                  (element) => element.image == unSelectedProduct[index].image);
            }
          });
        },
      ),
    );*/
  }
}

addtolist(ProductModel list, List<SelectedModel> selected) {
  for (var i = 0; i < list.imageSlider.length; i++) {
    selected.add(SelectedModel(list.imageSlider[i], false));
  }
}

class RoundedShapeInfo extends StatelessWidget {
  final String title;
  final Widget content;

  const RoundedShapeInfo({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              fontSize: 14,
              alignment: Alignment.center,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
