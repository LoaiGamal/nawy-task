import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nawy_task/widgets/common/filter_option_widget.dart';
import 'package:nawy_task/widgets/common/modal_bottom_sheet_widget.dart';
import 'package:nawy_task/widgets/common/option_list_tile_widget.dart';
import 'package:nawy_task/widgets/common/primary_button_widget.dart';
import 'package:nawy_task/widgets/common/range_slider_widget.dart';
import 'package:nawy_task/widgets/common/search_field_widget.dart';

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
    return SearchFieldWidget(
      controller: _searchController,
      hintText: 'Area, Compound, Developer',
      prefixIcon: Icons.search,
    );
  }

  Widget _buildPriceFilter() {
    return FilterOptionWidget(
      title: 'Price',
      selectedValue: _selectedPrice,
      onTap: () => _showPriceOptions(),
    );
  }

  Widget _buildRoomsFilter() {
    return RangeSliderWidget(
      title: 'Rooms',
      values: _roomRange,
      min: 1,
      max: 4,
      divisions: 3,
      onChanged: (RangeValues values) {
        setState(() {
          _roomRange = values;
        });
      },
      valueFormatter: (values) => '${values.start.round()} ~ ${values.end.round()}+ rooms',
    );
  }

  Widget _buildShowResultsButton() {
    return Center(
      child: PrimaryButtonWidget(
        text: 'SHOW RESULTS',
        onPressed: () => _showResults(),
      ),
    );
  }


  void _showPriceOptions() {
    final priceOptions = [
      'Any',
      'Under 500K',
      '500K - 1M',
      '1M - 2M',
      '2M - 5M',
      'Above 5M',
    ];

    ModalBottomSheetWidget.show(
      context: context,
      title: 'Select Price Range',
      children: priceOptions.map((price) => _buildPriceOption(price)).toList(),
    );
  }

  Widget _buildPriceOption(String price) {
    return OptionListTileWidget(
      title: price,
      isSelected: _selectedPrice == price,
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
