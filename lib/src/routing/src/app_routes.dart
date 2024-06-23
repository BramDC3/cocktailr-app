// These should only be used by the GoRouter and the AppRoutes
class AppRouteNames {
  const AppRouteNames._();

  static const cocktails = 'cocktails';
  static const cocktailSearch = 'search';
  static const profile = 'profile';
}

class AppRoutes {
  const AppRoutes._();

  static String getCocktailsUrl() => '/${AppRouteNames.cocktails}';
  static String getCocktailDetailUrl(int id) => '/${AppRouteNames.cocktails}/$id';
  static String getCocktailSearchUrl() => '/${AppRouteNames.cocktails}/${AppRouteNames.cocktailSearch}';
  static String getCocktailSearchDetailUrl(int id) => '/${AppRouteNames.cocktails}/${AppRouteNames.cocktailSearch}/$id';

  static String getProfileUrl() => '/${AppRouteNames.profile}';
}
