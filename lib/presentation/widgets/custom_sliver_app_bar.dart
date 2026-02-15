import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/my_colors.dart';

class CustomSliverAppBar<T> extends StatelessWidget {
  final T item;
  final Widget Function() flexibleSpaceBarBackground;
  final double expandedHeight;
  final String title;

  const CustomSliverAppBar({
    super.key,
    required this.item,
    required this.flexibleSpaceBarBackground,
    required this.expandedHeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isFav = BlocProvider.of<FavouritesCubit<T>>(context).isFavourite(item);
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<FavouritesCubit<T>>(context).toggleFavourites(item);
          },
          icon: isFav
              ? const Icon(Icons.favorite_sharp)
              : const Icon(Icons.favorite_outline_sharp),
        ),
      ],
      iconTheme: const IconThemeData(color: MyColors.myWhite),
      expandedHeight: expandedHeight,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myLightGrey,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: flexibleSpaceBarBackground(),
        title: Text(
          title,
          style: const TextStyle(letterSpacing: 12, color: MyColors.myWhite),
          softWrap: true,
          overflow: .ellipsis,
        ),
        centerTitle: true,
      ),
    );
  }
}



  // Widget _buildSliverAppBar() {
  //   bool isFav = BlocProvider.of<FavouritesCubit<Agent>>(
  //     context,
  //   ).isFavourite(widget.agent);
  //   return 
  // }


  // Widget _buildSliverAppBar() {
  //   bool isFav = BlocProvider.of<FavouritesCubit<ValorantMap>>(
  //     context,
  //   ).isFavourite(widget.valorantMap);
  //   return SliverAppBar(
  //     actions: [
  //       IconButton(
  //         onPressed: () {
  //           BlocProvider.of<FavouritesCubit<ValorantMap>>(
  //             context,
  //           ).toggleFavourites(widget.valorantMap);
  //         },
  //         icon: isFav
  //             ? const Icon(Icons.favorite_sharp)
  //             : const Icon(Icons.favorite_outline_sharp),
  //       ),
  //     ],
  //     iconTheme: const IconThemeData(color: MyColors.myWhite),

  //     expandedHeight: 400,
  //     pinned: true,
  //     stretch: true,
  //     backgroundColor: MyColors.myLightGrey,
  //     centerTitle: true,
  //     flexibleSpace: FlexibleSpaceBar(
  //       background: _buildFlexibleSpaceBarBackground(),
  //       title: Text(
  //         widget.valorantMap.displayName!,
  //         style: const TextStyle(letterSpacing: 12, color: MyColors.myWhite),
  //         softWrap: true,
  //         overflow: .ellipsis,
  //       ),
  //     ),
  //   );
  // }  