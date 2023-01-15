import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercellostore/constance.dart';
import 'package:supercellostore/view/widgets/custom_text.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 60,
          width: 150,
          child: GestureDetector(
            onTap: () {
              const number = ClipboardData(text: '+963944700444');
              Clipboard.setData(number);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم النسخ الى الحافظة')),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomText(
                  text: 'للتواصل جملة',
                  alignment: Alignment.center,
                ),
                CustomText(
                  text: '+963944700444',
                  color: Colors.amber,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
