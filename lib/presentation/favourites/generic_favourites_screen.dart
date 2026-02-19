import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/my_colors.dart';
import '../common/app_loading_indicator.dart';
import '../common/interactive_app_bar.dart';

class GenericFavouritesScreen<T> extends StatefulWidget {
  final String title;
  final String hint;
  final Widget Function(List<T> items) viewBuilder;
  final bool Function(T item, String userenteredQuery) searchFilter;

  const GenericFavouritesScreen({
    super.key,
    required this.title,
    required this.hint,
    required this.viewBuilder,
    required this.searchFilter,
  });

  @override
  State<GenericFavouritesScreen<T>> createState() =>
      _GenericFavouritesScreenState<T>();
}

class _GenericFavouritesScreenState<T>
    extends State<GenericFavouritesScreen<T>> {
  late List<T> favourites;
  List<T> searchedItems = [];

  Widget _buildNoFavouritesFoundWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const .all(16),
          child: Column(
            // mainAxisSize: .min,
            children: [
              SvgPicture.asset(
                "assets/images/svgs/favourites.svg",
                fit: .cover,
                height: 300,
              ),
              const SizedBox(height: 15),
              const Text(
                "No favourites found, Try adding some...",
                textAlign: .center,
                style: TextStyle(fontSize: 32, color: MyColors.myWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<FavouritesCubit<T>, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoaded) {
          favourites = (state.favourites) as List<T>;
          return searchedItems.isNotEmpty
              ? widget.viewBuilder(searchedItems)
              : widget.viewBuilder(favourites);
        } else if (state is NoFavourites) {
          favourites = [];
          return _buildNoFavouritesFoundWidget();
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }

  // the function that gets the searched items list
  void _searchItem(String searchedItem) {
    setState(() {
      searchedItems = favourites
          // where element inside the fav list matches the
          .where((element) => widget.searchFilter(element, searchedItem))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavouritesCubit<T>>(context).isFavouritesEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InteractiveAppBar(
        hint: widget.hint,
        title: widget.title,
        onSearchChanged: _searchItem,
      ),
      backgroundColor: MyColors.myGrey,
      body: _buildBlocWidget(),
    );
  }
}
