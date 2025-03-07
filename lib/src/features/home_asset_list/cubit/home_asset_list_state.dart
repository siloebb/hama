part of 'home_asset_list_cubit.dart';

@immutable
sealed class HomeAssetListState {}

final class HomeAssetListLoading extends HomeAssetListState {}

final class HomeAssetListLoaded extends HomeAssetListState {
  final List<HomeAsset> homeAssets;
  HomeAssetListLoaded(this.homeAssets);
}

final class HomeAssetListFailed extends HomeAssetListState {}
