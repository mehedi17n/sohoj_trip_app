import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/core/constants/styles.dart';
import 'package:sohoj_trip_app/core/helpers/asset_helper.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemNavbar(
            isSelected: selectedIndex == 0,
            label: 'home'.tr,
            assetIcon: AppAsset.icon('ic_home.png'),
            onTap: () => onTap(0),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 1,
            label: 'ticket'.tr,
            assetIcon: AppAsset.icon('ic_ticket.png'),
            onTap: () => onTap(1),
          ),
          SizedBox(width: Get.width / 5),
          ItemNavbar(
            isSelected: selectedIndex == 2,
            label: 'history'.tr,
            assetIcon: AppAsset.icon('ic_history.png'),
            onTap: () => onTap(2),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 3,
            label: 'setting'.tr,
            assetIcon: AppAsset.icon('ic_setting.png'),
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    Key? key,
    required this.isSelected,
    required this.label,
    this.assetIcon = '',
    this.onTap,
    this.icon,
  }) : super(key: key);

  final bool isSelected;
  final String label;
  final String assetIcon;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 22.w : 20.w,
              height: isSelected ? 22.w : 20.w,
              child: assetIcon.isNotEmpty
                  ? Image.asset(
                      assetIcon,
                      color: isSelected ? Colors.blue : Colors.grey,
                    )
                  : Icon(
                      icon,
                      color: isSelected ? Colors.blue : Colors.grey,
                      size: isSelected ? 22.w : 20.w,
                    ),
            ),
            verticalSpace(Insets.xs),
            Text(
              label,
              style: TextStyles.desc.copyWith(
                fontSize: 10.w,
                color: isSelected ? Color(0xFF5C40CC) : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
