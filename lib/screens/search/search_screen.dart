import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nawy_task/common/base/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  RangeValues _roomRange = const RangeValues(1, 4);
  String _selectedPrice = 'Any';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithAppBar(
      title: 'Search',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          _buildSearchField(),
          SizedBox(height: 24.h),
          _buildPriceFilter(),
          SizedBox(height: 24.h),
          _buildRoomsFilter(),
          SizedBox(height: 40.h),
          _buildShowResultsButton(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: MyAppTheme.instance.lightGrayColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Area, Compound, Developer',
          hintStyle: MyAppTheme.instance.hintTextStyle(),
          prefixIcon: Icon(
            Icons.search,
            color: MyAppTheme.instance.blueColor,
            size: 20.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    );
  }

  Widget _buildPriceFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: MyAppTheme.instance.titleStyle(),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _showPriceOptions(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedPrice,
                  style: MyAppTheme.instance.detailTextStyle(),
                ),
                Icon(
                  Icons.chevron_right,
                  color: MyAppTheme.instance.lightGrayColor,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: MyAppTheme.instance.lightGrayColor.withOpacity(0.2),
          thickness: 1,
        ),
      ],
    );
  }

  Widget _buildRoomsFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rooms',
              style: MyAppTheme.instance.titleStyle(),
            ),
            Text(
              '${_roomRange.start.round()} ~ ${_roomRange.end.round()}+ rooms',
              style: MyAppTheme.instance.detailTextStyle(),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        RangeSlider(
          values: _roomRange,
          min: 1,
          max: 4,
          divisions: 3,
          activeColor: MyAppTheme.instance.blueColor,
          inactiveColor: MyAppTheme.instance.lightBlueColor,
          onChanged: (RangeValues values) {
            setState(() {
              _roomRange = values;
            });
          },
        ),
      ],
    );
  }

  Widget _buildShowResultsButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () => _showResults(),
          style: ElevatedButton.styleFrom(
            backgroundColor: MyAppTheme.instance.blueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 0,
          ),
          child: Text(
            'SHOW RESULTS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }


  void _showPriceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Price Range',
              style: MyAppTheme.instance.titleStyle(),
            ),
            SizedBox(height: 20.h),
            _buildPriceOption('Any'),
            _buildPriceOption('Under 500K'),
            _buildPriceOption('500K - 1M'),
            _buildPriceOption('1M - 2M'),
            _buildPriceOption('2M - 5M'),
            _buildPriceOption('Above 5M'),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceOption(String price) {
    return ListTile(
      title: Text(price, style: MyAppTheme.instance.defaultStyle()),
      trailing: _selectedPrice == price
          ? Icon(Icons.check, color: MyAppTheme.instance.blueColor)
          : null,
      onTap: () {
        setState(() {
          _selectedPrice = price;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showResults() {
    context.push(RouteManager.results);
  }

}
