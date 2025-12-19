import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/constants/app_time.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class AnimatedSearchField extends StatefulWidget {
  const AnimatedSearchField({super.key});

  @override
  State<AnimatedSearchField> createState() => _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends State<AnimatedSearchField> {
  bool _isSearching = false;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _startSearch() {
    setState(() => _isSearching = true);
    Future.microtask(() => _focusNode.requestFocus());
  }

  void _stopSearch(ReadDataCubit cubit) {
    _controller.clear();
    cubit.setSearchQuery('');
    _focusNode.unfocus();
    cubit.clearFilters();
    setState(() => _isSearching = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: AppTime.milliseconds_150),
      transitionBuilder: (child, anim) =>
          FadeTransition(opacity: anim, child: child),
      child: _isSearching
          ? SizedBox(
              key: const ValueKey('searchField'),
              width: AppSize.s_150,
              child: _buildSearchField(context),
            )
          : Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                key: const ValueKey('searchIcon'),
                onPressed: _startSearch,
                color: AppColors.primary,
                iconSize: AppSize.s_33,
                icon: const Icon(Icons.search),
              ),
            ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    final readCubit = context.read<ReadDataCubit>();

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: readCubit.setSearchQuery,

      textInputAction: TextInputAction.search,
      style: context.textTheme.bodyMedium,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        isDense: true,
        hintText: AppStrings.search,
        hintStyle: context.textTheme.bodySmall,
        suffixIcon: IconButton(
          color: AppColors.primary,
          iconSize: AppSize.s_22,
          icon: const Icon(Icons.close),
          onPressed: () => _stopSearch(readCubit),
        ),
        border: _border(),
        focusedBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r_20),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    );
  }
}
