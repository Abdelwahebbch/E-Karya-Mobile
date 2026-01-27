import 'package:e_karya/services/app_write/appwrite_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: Consumer<AppwriteService>(
        builder: (context, authProvider, _) {
          if (authProvider.user == null) {
            return const Center(
              child: Text('User not found'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildProfileHeader(),
                const SizedBox(height: 24),
                _buildProfileInfo(authProvider.user),
                const SizedBox(height: 24),
                _buildMenuItems(context, authProvider),
                const SizedBox(height: 24),
                _buildLogoutButton(context, authProvider),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader() {
    final authProvider = context.read<AppwriteService>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: [
          const CircleAvatar(
              radius: 48,
              child: Icon(
                Icons.person,
                size: 48,
                color: AppColors.textSecondary,
              )),
          const SizedBox(height: 12),
          Text(
            '${authProvider.user?.name}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${authProvider.user?.email}',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              authProvider.isLandlord ? 'Landlord' : 'Tenant',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(dynamic user) {
    final authProvider = context.read<AppwriteService>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoCard('Phone Number', '${authProvider.user?.phone}'),
        const SizedBox(height: 8),
        _buildInfoCard('Member Since', '${authProvider.user?.$createdAt}'),
        const SizedBox(height: 8),
        _buildInfoCard('Rating', '${5} ⭐'),
        const SizedBox(height: 8),
        _buildInfoCard('Reviews', '100 reviews'),
      ],
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, AppwriteService authProvider) {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.edit,
          label: 'Edit Profile',
          onTap: () {
            // TODO: Navigate to edit profile screen
          },
        ),
        const SizedBox(height: 8),
        if (authProvider.isTenant)
          Column(
            children: [
              _buildMenuItem(
                icon: Icons.bookmark,
                label: 'My Bookings',
                onTap: () {
                  // TODO: Navigate to bookings screen
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        if (authProvider.isLandlord)
          Column(
            children: [
              _buildMenuItem(
                icon: Icons.home,
                label: 'My Properties',
                onTap: () {
                  // TODO: Navigate to landlord properties screen
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        _buildMenuItem(
          icon: Icons.star,
          label: 'My Reviews',
          onTap: () {
            // TODO: Navigate to reviews screen
          },
        ),
        const SizedBox(height: 8),
        _buildMenuItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {
            // TODO: Navigate to settings screen
          },
        ),
        const SizedBox(height: 8),
        _buildMenuItem(
          icon: Icons.help,
          label: 'Help & Support',
          onTap: () {
            // TODO: Navigate to help screen
          },
        ),
        const SizedBox(height: 8),
        _buildMenuItem(
          icon: Icons.privacy_tip,
          label: 'Privacy Policy',
          onTap: () {
            // TODO: Open privacy policy
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(
      BuildContext context, AppwriteService authProvider) {
    return CustomButton(
      text: 'Logout',
      onPressed: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Logout'),
              ),
            ],
          ),
        );

        if (confirmed == true && mounted) {
          await authProvider.logout();
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        }
      },
      backgroundColor: AppColors.error,
    );
  }


}
