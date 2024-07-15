import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailr/src/routing/routing.dart';
import 'package:cocktailr/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/providers.dart';
import '../../domain/models/cocktail.dart';

class CocktailsOverviewScreen extends StatelessWidget {
  const CocktailsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.royal200,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/img_bar_background.png',
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: _Header(),
                ),
                SizedBox(height: 24.0),
                Expanded(
                  child: _CocktailCarousel(),
                ),
                SizedBox(height: 48.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 32.0,
        top: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Bartenders\nFriend',
              style: context.title1.copyWith(
                color: context.white,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          AppIconButton(
            assetName: 'assets/icons/ic_search.svg',
            tooltip: MaterialLocalizations.of(context).searchFieldLabel,
            showInnerBorder: true,
            onPressed: () {
              context.go(AppRoutes.getCocktailSearchUrl());
            },
          ),
        ],
      ),
    );
  }
}

class _CocktailCarousel extends ConsumerStatefulWidget {
  const _CocktailCarousel();

  @override
  ConsumerState<_CocktailCarousel> createState() => _CocktailCarouselState();
}

class _CocktailCarouselState extends ConsumerState<_CocktailCarousel> {
  late final PageController _pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.8,
    )..addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage);
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cocktailsFuture = ref.watch(cocktailsProvider);

    return cocktailsFuture.when(
      skipLoadingOnRefresh: false,
      data: (cocktails) {
        return PageView.builder(
          controller: _pageController,
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            final cocktail = cocktails[index];

            return GestureDetector(
              onTap: () {
                context.go(
                  AppRoutes.getCocktailDetailUrl(cocktail.id),
                  extra: cocktail,
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: _CocktailCard(
                      cocktail: cocktail,
                      selected: index == currentPage,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  _CocktailName(name: cocktail.name),
                ],
              ),
            );
          },
        );
      },
      loading: () => const GeneralLoadingState(),
      error: (error, _) => GeneralErrorState(
        onPressed: () => ref.invalidate(cocktailsProvider),
      ),
    );
  }
}

class _CocktailCard extends StatefulWidget {
  const _CocktailCard({
    required this.cocktail,
    required this.selected,
  });

  final Cocktail cocktail;
  final bool selected;

  @override
  State<_CocktailCard> createState() => _CocktailCardState();
}

class _CocktailCardState extends State<_CocktailCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool _showBorder = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.selected) {
      _showBorder = true;
      _controller.animateTo(1.0, duration: Duration.zero);
    }
  }

  @override
  void didUpdateWidget(covariant _CocktailCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    setState(() {
      _showBorder = widget.selected;
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        decoration: BoxDecoration(
          border: _showBorder
              ? Border.all(
                  color: context.white.withOpacity(0.3),
                  width: 1.5,
                )
              : null,
        ),
        padding: const EdgeInsets.all(6.0),
        child: CachedNetworkImage(
          imageUrl: widget.cocktail.imageUri,
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => const GeneralLoadingState(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class _CocktailName extends StatelessWidget {
  const _CocktailName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: context.title2.copyWith(color: context.white),
        ),
        Stack(
          children: [
            Text(
              name,
              style: context.title2.copyWith(color: Colors.transparent),
            ),
            const Positioned.fill(
              child: Center(
                child: GoldenTrim(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
