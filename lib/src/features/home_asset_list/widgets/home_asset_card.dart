import 'package:flutter/material.dart';
import 'package:hama/src/core/domain/models/home_asset.dart';
import 'package:hama/src/core/system_design/widgets/delete_button.dart';

class HomeAssetCard extends StatelessWidget {
  final HomeAsset homeAsset;
  final void Function() onDelete;
  const HomeAssetCard({
    super.key,
    required this.homeAsset,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 100),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            homeAsset.type.image,
            width: 48,
            height: 48,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.error),
          ),
          const SizedBox(height: 16),
          Text(
            homeAsset.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          HAMDeleteButton(onPressed: onDelete),
        ],
      ),
    );
  }
}
