import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(String sort, String subspecialty, String type) onApplyFilter;

  const FilterBottomSheet({
    super.key,
    required this.onApplyFilter,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedSort = '';
  String selectedSubspecialty = '';
  String selectedType = 'Appointment';

  void _resetFilters() {
    setState(() {
      selectedSort = '';
      selectedSubspecialty = '';
      selectedType = 'Appointment';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with centered title
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _resetFilters,
                    icon: const Icon(Icons.refresh, color: ColorsManager.primary, size: 20),
                    label: Text(
                      'Reset',
                      style: TextStylesManager.bold16.copyWith(
                        color: ColorsManager.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: ColorsManager.primary),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Text(
                'Filter Doctors',
                style: TextStylesManager.extraBold20.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ],
          ),
          Divider(height: 24.h),

          // Sort by section
          Text(
            'Sort by',
            style: TextStylesManager.extraBold20.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 16.w,
            children: [
              _buildRadioOption('Highest rated', 'Highest rated'),
              _buildRadioOption('Lowest price', 'Lowest price'),
            ],
          ),
          SizedBox(height: 24.h),

          // Subspecialties dropdown
          Text(
            'Subspecialties',
            style: TextStylesManager.extraBold20.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          SizedBox(height: 12.h),
          _buildDropdown(
            value: selectedSubspecialty.isEmpty ? null : selectedSubspecialty,
            hint: 'Choose subspecialty',
            items: const ['Cardiology', 'Neurology', 'Pediatrics'],
            onChanged: (value) {
              setState(() => selectedSubspecialty = value!);
            },
          ),
          SizedBox(height: 24.h),

          // Reservation type dropdown
          Text(
            'Reservation type',
            style: TextStylesManager.extraBold20.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          SizedBox(height: 12.h),
          _buildDropdown(
            value: selectedType,
            hint: 'Select type',
            items: const ['Appointment', 'Video Call', 'Home Visit'],
            onChanged: (value) {
              setState(() => selectedType = value!);
            },
          ),
          SizedBox(height: 32.h),

          // Apply button
          CustomButton(
            onTap: () {
              widget.onApplyFilter(selectedSort, selectedSubspecialty, selectedType);
              Navigator.pop(context);
            },
            text: 'Show Results (120)',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: selectedSort == value
              ? ColorsManager.primary
              : Colors.grey.shade300,
        ),
        color: selectedSort == value
            ? ColorsManager.primary.withOpacity(0.1)
            : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() => selectedSort = value),
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                value: value,
                groupValue: selectedSort,
                onChanged: (value) => setState(() => selectedSort = value!),
                activeColor: ColorsManager.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                label,
                style: TextStylesManager.semiBold16.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: ColorsManager.primary),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: ColorsManager.primary, width: 2),
        ),
        filled: true,
        fillColor: value != null
            ? ColorsManager.primary.withOpacity(0.1)
            : Colors.grey.shade50,
      ),
      value: value,
      hint: Text(
        hint,
        style: TextStylesManager.semiBold16.copyWith(
          color: Colors.grey.shade600,
        ),
      ),
      items: items.map((item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStylesManager.semiBold16.copyWith(
            color: ColorsManager.primary,
          ),
        ),
      )).toList(),
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down, color: ColorsManager.primary),
      dropdownColor: Colors.white,
      elevation: 3,
    );
  }
}