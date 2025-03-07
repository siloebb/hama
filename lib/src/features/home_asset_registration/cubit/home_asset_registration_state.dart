part of 'home_asset_registration_cubit.dart';

@immutable
class HomeAssetRegistrationState {
  final AssetType? selectedAssetType;
  final String assetName;
  final FormAssetRegistrationStep step;
  final String? errorMessage; 

  const HomeAssetRegistrationState({
    this.selectedAssetType,
    this.assetName = '',
    this.step = FormAssetRegistrationStep.filling,
    this.errorMessage,
  });

  HomeAssetRegistrationState copyWith({
    AssetType? selectedAssetType,
    String? assetName,
    FormAssetRegistrationStep? step,
    String? errorMessage,
  }) {
    return HomeAssetRegistrationState(
      selectedAssetType: selectedAssetType ?? this.selectedAssetType,
      assetName: assetName ?? this.assetName,
      step: step ?? this.step,
      errorMessage: errorMessage,
    );
  }
}

enum FormAssetRegistrationStep {
  filling,
  loading,
  success,
  failure,
}