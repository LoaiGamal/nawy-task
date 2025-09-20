import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/common/base/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int _selectedTabIndex = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithAppBar(
      title: 'Results',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(MyAppImages.icFilter),
          onPressed: () => _showFilterOptions(),
        ),
        IconButton(
          icon: SvgPicture.asset(MyAppImages.icSort),
          onPressed: () => _showSortOptions(),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildFilterChips(),
          SizedBox(height: 16.h),
          _buildContentTabs(),
          SizedBox(height: 8.h),
          _buildResultsCount(),
          SizedBox(height: 16.h),
          Expanded(
            child: _buildPropertyList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = [
      'City, Governorate',
      'Compound name',
      'Apartment',
      'Villa',
      'Townhouse',
    ];

    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            child: FilterChip(
              label: Text(
                filters[index],
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: index == 0,
              // First chip selected by default
              onSelected: (selected) {
                setState(() {
                  // Handle filter selection
                });
              },
              backgroundColor: MyAppTheme.instance.lightBlueColor,
              selectedColor: MyAppTheme.instance.blueColor,
              checkmarkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTab('PROPERTIES', 0),
        SizedBox(width: 24.w),
        _buildTab('COMPOUNDS', 1),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              color: isSelected
                  ? MyAppTheme.instance.blueColor
                  : MyAppTheme.instance.grayColor,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 3.h,
            width: title.length * 8.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? MyAppTheme.instance.blueColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsCount() {
    return Text(
      '450 results',
      style: MyAppTheme.instance.hintTextStyle().copyWith(color: Colors.black),
    );
  }

  Widget _buildPropertyList() {
    return ListView.builder(
      itemCount: 10, // Mock data
      itemBuilder: (context, index) {
        return _buildPropertyCard();
      },
    );
  }

  Widget _buildPropertyCard() {
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
            'Serviced apartment',
            style: MyAppTheme.instance.titleStyle(),
          ),
        ),
        Text(
          'Delivery 2028',
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
                'EGP 999,999,999',
                style: MyAppTheme.instance.largeTextStyle(),
              ),
              SizedBox(height: 4.h),
              Text(
                '117,493 EGP/month over 7 years',
                style: MyAppTheme.instance.detailTextStyle(),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          child: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color:
                _isFavorite ? Colors.red : MyAppTheme.instance.lightBlueColor,
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
          'Mountain View - Chillout park',
          style: MyAppTheme.instance.defaultStyle(),
        ),
        SizedBox(height: 2.h),
        Text(
          '6th October, Egypt',
          style: MyAppTheme.instance.defaultStyle(),
        ),
      ],
    );
  }

  Widget _buildPropertySpecs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSpecItem(MyAppImages.icBed, '9'),
        SizedBox(width: 16.w),
        _buildSpecItem(MyAppImages.icBath, '9'),
        SizedBox(width: 16.w),
        _buildSpecItem(MyAppImages.icArea, '240-320 m²'),
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
            }),
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
              // Show user-friendly error message instead of crashing
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
              await launchUrl(whatsappUri,
                  mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint('Error launching WhatsApp: $e');
              // Show user-friendly error message instead of crashing
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

  OutlinedButton _contactButton(
      {required String label,
      required String iconPath,
      required int width,
      required int height,
      required Function() onPressed}) {
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
            fontWeight: FontWeight.w700, color: MyAppTheme.instance.blueColor),
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
          style: MyAppTheme.instance.detailTextStyle().copyWith(color: MyAppTheme.instance.primaryColor),
        ),
      ],
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter Options',
              style: MyAppTheme.instance.titleStyle(),
            ),
            SizedBox(height: 20.h),
            // Add filter options here
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sort Options',
              style: MyAppTheme.instance.titleStyle(),
            ),
            SizedBox(height: 20.h),
            // Add sort options here
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Apply Sort'),
            ),
          ],
        ),
      ),
    );
  }
}
