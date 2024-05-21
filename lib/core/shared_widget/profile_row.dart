import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/edit_profile/cubit/editprofile_cubit.dart';
import 'package:nfc_card/features/edit_profile/edit_profile_view.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              Text(
                'أحمد مبروك',
                style: AppStyles.customTextStyleBl5,
              ),
              Text(
                'UX UI Designer',
                style: AppStyles.customTextStyleG4,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              navigateAndReplace(
                context: context,
                screen: BlocProvider<EditProfileCubit>(
                  create: (context) => EditProfileCubit(),
                  child: const EditProfileView(),
                ),
              );
            },
            child: const Icon(
              Iconsax.edit,
              color: AppStyles.primaryG,
            ),
          ),
        ],
      ),
    );
  }
}
