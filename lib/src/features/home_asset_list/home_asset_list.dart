import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/system_design/widgets/loading_indicator.dart';
import 'package:hama/src/features/home_asset_list/cubit/home_asset_list_cubit.dart';
import 'package:hama/src/features/home_asset_list/widgets/home_asset_card.dart';

class HomeAssetList extends StatefulWidget {
  final Home home;
  const HomeAssetList({super.key, required this.home});

  @override
  State<HomeAssetList> createState() => _HomeAssetListState();
}

class _HomeAssetListState extends State<HomeAssetList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAssetListCubit, HomeAssetListState>(
      builder: (context, state) {
        if (state is HomeAssetListLoading) {
          return HAMLoadingIndicator();
        } else if (state is HomeAssetListLoaded) {
          if (state.homeAssets.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('No assets found'),
              ),
            );
          }

          return Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.homeAssets.length,
              itemBuilder: (context, index) {
                final asset = state.homeAssets[index];
                return HomeAssetCard(
                  homeAsset: asset,
                  onDelete: () {
                    context.read<HomeAssetListCubit>().delete(asset);
                  },
                );
              },
            ),
          );
        } else {
          return Text('Failed to load assets');
        }
      },
    );
  }
}
