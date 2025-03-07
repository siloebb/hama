import 'package:flutter/material.dart';
import 'package:hama/src/core/domain/models/home_asset.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/system_design/widgets/loading_indicator.dart';
import 'package:hama/src/core/system_design/widgets/primary_button.dart';
import 'package:hama/src/features/home_asset_registration/cubit/home_asset_registration_cubit.dart';

class HomeAssetRegistrationPage extends StatelessWidget {
  final String homeId;

  const HomeAssetRegistrationPage({super.key, required this.homeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeAssetRegistrationCubit(RepositoryProvider.of(context)),
      child: _HomeAssetRegistrationView(homeId: homeId),
    );
  }
}

class _HomeAssetRegistrationView extends StatefulWidget {
  final String homeId;

  const _HomeAssetRegistrationView({required this.homeId});

  @override
  State<_HomeAssetRegistrationView> createState() =>
      _HomeAssetRegistrationViewState();
}

class _HomeAssetRegistrationViewState
    extends State<_HomeAssetRegistrationView> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();

  void _goToNextPage(AssetType selectedType) {
    final cubit = context.read<HomeAssetRegistrationCubit>();
    cubit.selectAssetType(selectedType);
    _nameController.text = selectedType.label;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _registerAsset() {
    final cubit = context.read<HomeAssetRegistrationCubit>();
    cubit.createHomeAsset(widget.homeId);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Asset')),
      body:
          BlocConsumer<HomeAssetRegistrationCubit, HomeAssetRegistrationState>(
            listener: _listenStates,
            builder: (context, state) {
              if(state.step == FormAssetRegistrationStep.loading) {
                return const Center(child: HAMLoadingIndicator());
              }
              return PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _AssetTypeSelection(_goToNextPage),
                  _AssetNameInput(_registerAsset, _nameController),
                ],
              );
            },
          ),
    );
  }

  _listenStates(BuildContext context, HomeAssetRegistrationState state) {
    if (state.step == FormAssetRegistrationStep.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Asset "${state.assetName}" created successfully!'),
        ),
      );
      Navigator.pop(context);
    }
    if (state.step == FormAssetRegistrationStep.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
      );
    }
  }
}

class _AssetTypeSelection extends StatelessWidget {
  final Function(AssetType type) goToNextPage;
  const _AssetTypeSelection(this.goToNextPage);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAssetRegistrationCubit, HomeAssetRegistrationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Select Asset Type:', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: AssetType.values.length,
                  itemBuilder: (context, index) {
                    final type = AssetType.values[index];
                    final isSelected = type == state.selectedAssetType;

                    return GestureDetector(
                      onTap:
                          () => context
                              .read<HomeAssetRegistrationCubit>()
                              .selectAssetType(type),
                      child: Card(
                        color: isSelected ? Colors.blue[100] : Colors.white,
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(type.imagePath, height: 64, width: 64),
                            const SizedBox(height: 12),
                            Text(type.label, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 18),
              HAMPrimaryButton(
                onPressed: () {
                  if (state.selectedAssetType != null) {
                    goToNextPage(state.selectedAssetType!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an asset type'),
                      ),
                    );
                  }
                },
                icon: Icons.arrow_forward,
                label: 'Next',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AssetNameInput extends StatelessWidget {
  final TextEditingController _nameController;
  final VoidCallback onRegister;

  const _AssetNameInput(this.onRegister, this._nameController);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAssetRegistrationCubit, HomeAssetRegistrationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text('Define a name for the asset:'),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController..text = state.assetName,
                onChanged:
                    (value) => context
                        .read<HomeAssetRegistrationCubit>()
                        .setAssetName(value),
                decoration: const InputDecoration(
                  labelText: 'Asset Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              HAMPrimaryButton(
                onPressed: onRegister,
                icon: Icons.save,
                label: 'Register',
              ),
            ],
          ),
        );
      },
    );
  }
}
