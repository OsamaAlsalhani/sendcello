import 'package:flutter/material.dart';
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
        backgroundColor: primaryColor,
        onPressed: () {
          addtocart(selectedProduct);
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 20,
                      color: Colors.black54,
                    )
                  ],
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
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
                    const SizedBox(height: 20),
                    CustomText(
                      text: widget._productModel.description,
                      fontSize: 18,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          text: '${widget._productModel.price} S.P',
                          fontSize: 18,
                          alignment: Alignment.bottomCenter,
                        ),
                        const SizedBox(width: 10),
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
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Hero(
                  tag: image,
                  child: Image.network(
                    height: 180,
                    width: 180,
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
                    color: Colors.amberAccent,
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
  }
}

addtolist(ProductModel list, List<SelectedModel> selected) {
  for (var i = 0; i < list.imageSlider.length; i++) {
    selected.add(SelectedModel(list.imageSlider[i], false));
  }
}
