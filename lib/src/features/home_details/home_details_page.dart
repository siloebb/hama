import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/system_design/widgets/loading_indicator.dart';
import 'package:hama/src/core/system_design/widgets/primary_button.dart';
import 'package:hama/src/features/home_asset_registration/home_asset_registration_page.dart';
import 'package:hama/src/features/home_asset_list/cubit/home_asset_list_cubit.dart';
import 'package:hama/src/features/home_details/cubit/home_details_cubit.dart';
import 'package:hama/src/features/home_asset_list/home_asset_list.dart';

class HomeDetailsPage extends StatefulWidget {
  final Home home;
  const HomeDetailsPage({super.key, required this.home});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  late final HomeDetailsCubit _homeDetailsCubit;
  late final HomeAssetListCubit _homeAssetListCubit;

  @override
  void initState() {
    super.initState();
    _homeDetailsCubit = HomeDetailsCubit(context.read(), homeId: widget.home.id);
    _homeAssetListCubit = HomeAssetListCubit(context.read(), widget.home.id);
    _homeDetailsCubit.load();
    _homeAssetListCubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Details')),
      body: BlocBuilder<HomeDetailsCubit, HomeDetailsState>(
        bloc: _homeDetailsCubit,
        builder: (context, state) {
          if (state is HomeDetailsFailed) {
            return Center(child: Text('Failed to load home details'));
          } else if (state is HomeDetailsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.home.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.home.address.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: HAMPrimaryButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => HomeAssetRegistrationPage(
                                homeId: widget.home.id,
                              ),
                        ),
                      ).then((context) {
                        _homeDetailsCubit.load();
                        _homeAssetListCubit.load();                        
                      });
                    },
                    icon: Icons.add,
                    label: 'New Assets',
                  ),
                ),
                BlocProvider(
                  create: (context) => _homeAssetListCubit,
                  child: HomeAssetList(home: state.home),
                ),
              ],
            );
          }
          return Center(child: HAMLoadingIndicator());
        },
      ),
    );
  }
}
