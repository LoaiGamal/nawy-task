import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/common/base/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyCardWidget extends StatefulWidget {
  final String title;
  final String deliveryDate;
  final String price;
  final String monthlyPayment;
  final String location;
  final String address;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;

  const PropertyCardWidget({
    super.key,
    required this.title,
    required this.deliveryDate,
    required this.price,
    required this.monthlyPayment,
    required this.location,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    this.onFavoriteToggle,
    this.isFavorite = false,
  });

  @override
  State<PropertyCardWidget> createState() => _PropertyCardWidgetState();
}

class _PropertyCardWidgetState extends State<PropertyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPropertyImage(),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPropertyHeader(),
                SizedBox(height: 8.h),
                _buildPriceSection(),
                SizedBox(height: 8.h),
                _buildLocationSection(),
                SizedBox(height: 12.h),
                _buildPropertySpecs(),
                SizedBox(height: 12.h),
                _contactOptionRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyImage() {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        color: MyAppTheme.instance.lightBlueColor,
      ),
      child: Center(
        child: Icon(
          Icons.home,
          size: 60.sp,
          color: MyAppTheme.instance.blueColor,
        ),
      ),
    );
  }

  Widget _buildPropertyHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: MyAppTheme.instance.titleStyle(),
          ),
        ),
        Text(
          widget.deliveryDate,
          style: MyAppTheme.instance.defaultStyle().copyWith(
                color: MyAppTheme.instance.grayColor,
              ),
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.price,
                style: MyAppTheme.instance.largeTextStyle(),
              ),
              SizedBox(height: 4.h),
              Text(
                widget.monthlyPayment,
                style: MyAppTheme.instance.detailTextStyle(),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: widget.onFavoriteToggle,
          child: Icon(
            widget.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: widget.isFavorite
                ? Colors.red
                : MyAppTheme.instance.lightBlueColor,
            size: 24.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.location,
          style: MyAppTheme.instance.defaultStyle(),
        ),
        SizedBox(height: 2.h),
        Text(
          widget.address,
          style: MyAppTheme.instance.defaultStyle(),
        ),
      ],
    );
  }

  Widget _buildPropertySpecs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSpecItem(MyAppImages.icBed, widget.bedrooms),
        SizedBox(width: 16.w),
        _buildSpecItem(MyAppImages.icBath, widget.bathrooms),
        SizedBox(width: 16.w),
        _buildSpecItem(MyAppImages.icArea, widget.area),
      ],
    );
  }

  Row _contactOptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _contactButton(
          label: 'Zoom',
          iconPath: MyAppImages.icZoom,
          width: 9,
          height: 9,
          onPressed: () {
            // Handle Zoom action
          },
        ),
        _contactButton(
          label: 'Call',
          iconPath: MyAppImages.icCall,
          width: 16,
          height: 16,
          onPressed: () async {
            try {
              final Uri phoneUri = Uri.parse('tel:+201121266236');
              await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint('Error launching dialer: $e');
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Unable to open phone dialer'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
        ),
        _contactButton(
          label: 'WhatsApp',
          iconPath: MyAppImages.icWhatsapp,
          width: 16,
          height: 16,
          onPressed: () async {
            try {
              const String url = 'https://wa.me/+201121266236?text=';
              final Uri whatsappUri = Uri.parse(url);
              await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint('Error launching WhatsApp: $e');
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Unable to open WhatsApp'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }

  OutlinedButton _contactButton({
    required String label,
    required String iconPath,
    required int width,
    required int height,
    required Function() onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: width.w,
        height: height.h,
      ),
      label: Text(
        label,
        style: MyAppTheme.instance.hintTextStyle().copyWith(
              fontWeight: FontWeight.w700,
              color: MyAppTheme.instance.blueColor,
            ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: MyAppTheme.instance.blueColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      ),
    );
  }

  Widget _buildSpecItem(String iconPath, String value) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 22.w,
          height: 22.h,
        ),
        SizedBox(width: 4.w),
        Text(
          value,
          style: MyAppTheme.instance.detailTextStyle().copyWith(
                color: MyAppTheme.instance.primaryColor,
              ),
        ),
      ],
    );
  }
}
