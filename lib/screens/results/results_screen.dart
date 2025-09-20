import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/widgets/common/filter_chip_list_widget.dart';
import 'package:nawy_task/widgets/common/modal_bottom_sheet_widget.dart';
import 'package:nawy_task/widgets/common/primary_button_widget.dart';
import 'package:nawy_task/widgets/common/results_count_widget.dart';
import 'package:nawy_task/widgets/common/tab_selector_widget.dart';
import 'package:nawy_task/widgets/property/property_card_widget.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int _selectedTabIndex = 0;
  int _selectedFilterIndex = 0;
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

    return FilterChipListWidget(
      filters: filters,
      selectedIndex: _selectedFilterIndex,
      onFilterSelected: (index) {
        setState(() {
          _selectedFilterIndex = index;
        });
      },
    );
  }

  Widget _buildContentTabs() {
    return TabSelectorWidget(
      tabs: const ['PROPERTIES', 'COMPOUNDS'],
      selectedIndex: _selectedTabIndex,
      onTabSelected: (index) {
        setState(() {
          _selectedTabIndex = index;
        });
      },
    );
  }

  Widget _buildResultsCount() {
    return const ResultsCountWidget(count: 450);
  }

  Widget _buildPropertyList() {
    return ListView.builder(
      itemCount: 10, // Mock data
      itemBuilder: (context, index) {
        return PropertyCardWidget(
          title: 'Serviced apartment',
          deliveryDate: 'Delivery 2028',
          price: 'EGP 999,999,999',
          monthlyPayment: '117,493 EGP/month over 7 years',
          location: 'Mountain View - Chillout park',
          address: '6th October, Egypt',
          bedrooms: '9',
          bathrooms: '9',
          area: '240-320 m²',
          isFavorite: _isFavorite,
          onFavoriteToggle: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
        );
      },
    );
  }


  void _showFilterOptions() {
    ModalBottomSheetWidget.show(
      context: context,
      title: 'Filter Options',
      children: [
        // Add filter options here
      ],
      actionButton: PrimaryButtonWidget(
        text: 'Apply Filters',
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  void _showSortOptions() {
    ModalBottomSheetWidget.show(
      context: context,
      title: 'Sort Options',
      children: [
        // Add sort options here
      ],
      actionButton: PrimaryButtonWidget(
        text: 'Apply Sort',
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
