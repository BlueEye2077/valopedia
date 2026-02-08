import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valopedia/business_logic/cubit/favourites/favourites_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/map/valorant_map.dart';
import 'package:valopedia/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:valopedia/presentation/widgets/details_divider.dart';
import 'package:valopedia/presentation/widgets/section_title.dart';

class ValorantMapDetailsScreen extends StatelessWidget {
  final ValorantMap valorantMap;
  const ValorantMapDetailsScreen({super.key, required this.valorantMap});

  Widget _buildFlexibleSpaceBarBackground() {
    return Container(
      child: Hero(
        tag: valorantMap.uuid!,

        child: CachedNetworkImage(
          imageUrl: valorantMap.splash!,
          cacheKey: valorantMap.uuid!, // Explicit cache key
          fit: BoxFit.cover,
          memCacheWidth: 800, // Optimize memory cache
          memCacheHeight: 450, // Optimize memory cache
          maxWidthDiskCache: 1000, // Optimize disk cache
          maxHeightDiskCache: 600, // Optimize disk cache
          placeholder: (context, url) => Image.asset(
            "assets/images/backgrounds/maps_placeholder.gif",
            fit: .cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          child: Column(
            children: [
              _buildInfoSquareRow(),
              const SizedBox(height: 20),
              Padding(
                padding: const .all(12),

                child: Column(
                  children: [
                    valorantMap.displayIcon != null
                        ? Column(
                            children: [
                              const SectionTitle(title: "Map Icon"),
                              const SizedBox(height: 6),
                              _buildMapIconCard(
                                height: 380,
                                child: _buildImageWithCornersStack(),
                              ),
                              const SizedBox(height: 6),
                              const DetailsDivider(),
                              const SizedBox(height: 6),
                            ],
                          )
                        : const SizedBox.shrink(),

                    valorantMap.stylizedBackgroundImage != null
                        ? Column(
                            children: [
                              const SectionTitle(
                                title: "Stylized Background Image",
                              ),
                              const SizedBox(height: 6),
                              const DetailsDivider(),
                              const SizedBox(height: 6),
                              _buildMapIconCard(
                                height: 230,
                                child: FadeInImage.memoryNetwork(
                                  fit: .cover,
                                  placeholder: kTransparentImage,
                                  image: valorantMap.stylizedBackgroundImage!,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),

                    const DetailsDivider(),
                    valorantMap.premierBackgroundImage != null
                        ? Column(
                            children: [
                              const SectionTitle(
                                title: "Premier Background Image",
                              ),

                              const SizedBox(height: 6),
                              const DetailsDivider(),
                              const SizedBox(height: 6),
                              _buildMapIconCard(
                                height: 230,
                                child: FadeInImage.memoryNetwork(
                                  fit: .cover,
                                  placeholder: kTransparentImage,

                                  image: valorantMap.premierBackgroundImage!,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildInfoSquareRow() {
    return Row(
      mainAxisSize: .max,
      children: [
        _buildInfoSuare(
          "Coordinates",
          valorantMap.coordinates ?? "No Coordinates",
        ),
        _buildInfoSuare(
          "Tactics",
          valorantMap.tacticalDescription ?? "A/B Sites",
        ),
      ],
    );
  }

  Widget _buildInfoSuare(String title, String data) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: const Color.fromARGB(68, 178, 180, 188),
          ),
        ),
        child: Padding(
          padding: const .all(6),
          child: Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  title,
                  // "Coordinates",
                  style: const TextStyle(fontSize: 12, color: MyColors.myRed),
                ),
                const SizedBox(height: 5),
                Text(
                  data,
                  style: const TextStyle(fontSize: 14, color: MyColors.myWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapIconCard({required Widget child, double? height}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(89, 178, 180, 188)),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      elevation: 3,
      color: const Color(0xFF1F2B38),
      child: Container(
        width: .infinity,
        height: height,
        margin: const .all(12),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 214, 213, 213),
        ),
        child: child,
      ),
    );
  }

  Widget _buildImageWithCornersStack() {
    return Stack(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: valorantMap.displayIcon!,
          fit: .cover,
        ),
        _buildCorners(top: 15, left: 15, color: MyColors.myRed, width: 2),
        _buildCorners(top: 15, right: 15, color: MyColors.myRed, width: 2),
        _buildCorners(bottom: 15, left: 15, color: MyColors.myRed, width: 2),
        _buildCorners(bottom: 15, right: 15, color: MyColors.myRed, width: 2),
      ],
    );
  }

  Widget _buildCorners({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Color color,
    required double width,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,

      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            top: top != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            left: left != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            right: right != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
            bottom: bottom != null
                ? BorderSide(color: color, width: width)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouritesCubit<ValorantMap>, FavouritesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                item: valorantMap,
                flexibleSpaceBarBackground: _buildFlexibleSpaceBarBackground,
                expandedHeight: 400,
                title: valorantMap.displayName!,
              ),

              _buildSliverBody(),
            ],
          );
        },
      ),
    );
  }
}
