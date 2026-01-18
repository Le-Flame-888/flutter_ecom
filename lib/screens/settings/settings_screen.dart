import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _promoEmails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSectionHeader('Notifications'),
          _buildSwitchTile(
            context,
            'Push Notifications',
            'Receive alerts for new deals',
            _pushNotifications,
            (val) => setState(() => _pushNotifications = val),
          ),
          _buildSwitchTile(
            context,
            'Email Notifications',
            'Order updates via email',
            _emailNotifications,
            (val) => setState(() => _emailNotifications = val),
          ),
          _buildSwitchTile(
            context,
            'Promotional Emails',
            'Weekly newsletters and offers',
            _promoEmails,
            (val) => setState(() => _promoEmails = val),
          ),

          const SizedBox(height: 32),
          _buildSectionHeader('Preferences'),
          _buildListTile(
            context,
            'Language',
            'English (US)',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Language selection is not implemented yet.'),
                ),
              );
            },
          ),
          _buildListTile(context, 'Currency', 'USD (\$)', onTap: () {}),

          const SizedBox(height: 32),
          _buildSectionHeader('Security & Policy'),
          _buildListTile(context, 'Privacy Policy', '', onTap: () {}),
          _buildListTile(context, 'Terms of Service', '', onTap: () {}),
          _buildListTile(context, 'Change Password', '', onTap: () {}),

          const SizedBox(height: 48),
          const Center(
            child: Text(
              'App Version 1.0.0',
              style: TextStyle(color: AppTheme.mediumGray, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppTheme.mediumGray,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SwitchListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppTheme.mediumGray),
        ),
        value: value,
        onChanged: onChanged,
        activeThumbColor: AppTheme.primaryColor,
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    String value, {
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value.isNotEmpty)
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.mediumGray,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (value.isNotEmpty) const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppTheme.mediumGray,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
