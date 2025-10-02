import 'dart:async';

import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppbarState();
}

class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  final _showClearButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    _searchController.addListener(
      () {
        _showClearButton.value = _searchController.text.isNotEmpty;
      },
    );
    super.initState();
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      _debounce?.cancel();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      FocusScope.of(context).unfocus();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByName(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        title: SizedBox(
          height: 30,
          child: TextFormField(
            controller: _searchController,
            onChanged: onSearchChanged,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar filme',
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  size: 16,
                  color: Colors.grey[600],
                ),
              ),
              suffixIconConstraints: BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ValueListenableBuilder(
                  valueListenable: _showClearButton,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: value,
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 15,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(moviesViewModelProvider.notifier)
                              .fetchMoviesByCategory();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
