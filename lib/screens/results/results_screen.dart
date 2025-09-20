import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/providers/property_provider.dart';
import 'package:nawy_task/providers/results_provider.dart';
import 'package:nawy_task/widgets/common/filter_chip_list_widget.dart';
import 'package:nawy_task/widgets/common/modal_bottom_sheet_widget.dart';
import 'package:nawy_task/widgets/common/option_list_tile_widget.dart';
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
    return Consumer<ResultsProvider>(
      builder: (context, resultsProvider, child) {
        final filters = resultsProvider.allFilterTypes
            .map((type) => resultsProvider.getFilterTypeText(type))
            .toList();

        return FilterChipListWidget(
          filters: filters,
          selectedIndex: resultsProvider.selectedFilterIndex,
          onFilterSelected: (index) {
            resultsProvider.updateSelectedFilter(index);
          },
        );
      },
    );
  }

  Widget _buildContentTabs() {
    return Consumer<ResultsProvider>(
      builder: (context, resultsProvider, child) {
        return TabSelectorWidget(
          tabs: const ['PROPERTIES', 'COMPOUNDS'],
          selectedIndex: resultsProvider.selectedTabIndex,
          onTabSelected: (index) {
            resultsProvider.updateSelectedTab(index);
          },
        );
      },
    );
  }

  Widget _buildResultsCount() {
    return Consumer<PropertyProvider>(
      builder: (context, propertyProvider, child) {
        return ResultsCountWidget(count: propertyProvider.filteredProperties.length);
      },
    );
  }

  Widget _buildPropertyList() {
    return Consumer<PropertyProvider>(
      builder: (context, propertyProvider, child) {
        if (propertyProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (propertyProvider.error != null) {
          return Center(
            child: Text('Error: ${propertyProvider.error}'),
          );
        }

        return ListView.builder(
          itemCount: propertyProvider.filteredProperties.length,
          itemBuilder: (context, index) {
            final property = propertyProvider.filteredProperties[index];
            return PropertyCardWidget(
              title: property.title,
              deliveryDate: property.deliveryDate,
              price: property.price,
              monthlyPayment: property.monthlyPayment,
              location: property.location,
              address: property.address,
              bedrooms: property.bedrooms,
              bathrooms: property.bathrooms,
              area: property.area,
              isFavorite: propertyProvider.isFavorite(property.id),
              onFavoriteToggle: () {
                propertyProvider.toggleFavorite(property.id);
              },
            );
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
    final resultsProvider = context.read<ResultsProvider>();
    
    ModalBottomSheetWidget.show(
      context: context,
      title: 'Sort Options',
      children: resultsProvider.allSortOptions.map((option) {
        return OptionListTileWidget(
          title: resultsProvider.getSortOptionText(option),
          isSelected: resultsProvider.selectedSortOption == option,
          onTap: () {
            resultsProvider.updateSortOption(option);
            context.read<PropertyProvider>().sortProperties(resultsProvider.getSortOptionText(option));
            Navigator.pop(context);
          },
        );
      }).toList(),
      actionButton: PrimaryButtonWidget(
        text: 'Apply Sort',
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
