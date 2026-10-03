import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/app_dialog.dart';
import '../../../core/app_routes.dart';
import '../../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback? onRefresh;

  const ContactCard({
    super.key,
    required this.contact,
    this.onRefresh,
  });

  void _showEditDialog(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.addContact,
      arguments: contact,
    );
    if (result == true) {
      onRefresh?.call();
    }
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF0D1B3E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Delete Contact',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to delete ${contact.name}?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              AppDialog.showLoading(context, message: 'Deleting contact...');

              try {
                await FirebaseFirestore.instance
                    .collection('contacts')
                    .doc(contact.id)
                    .delete();

                if (context.mounted) {
                  AppDialog.hide(context);
                }
                onRefresh?.call();
              } catch (e) {
                if (context.mounted) {
                  AppDialog.hide(context);
                  AppDialog.showError(context, message: 'Failed to delete contact: $e');
                }
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Color(0xFFFF6B6B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarColor = _nameColor(contact.name);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0D1B3E).withValues(alpha: 0.85),
            const Color(0xFF122553).withValues(alpha: 0.85),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: avatarColor.withValues(alpha: 0.2),
          child: Text(
            contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
            style: TextStyle(
              color: avatarColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.phone_outlined, size: 13, color: Color(0xFF7EC8E3)),
            const SizedBox(width: 4),
            Text(
              contact.phone,
              style: const TextStyle(
                color: Color(0xFF7EC8E3),
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ActionButton(
              icon: Icons.edit_outlined,
              color: const Color(0xFF64B5F6),
              onTap: () => _showEditDialog(context),
            ),
            const SizedBox(width: 6),
            _ActionButton(
              icon: Icons.delete_outline,
              color: const Color(0xFFFF6B6B),
              onTap: () => _confirmDelete(context),
            ),
          ],
        ),
      ),
    );
  }

  Color _nameColor(String name) {
    const colors = [
      Color(0xFF64B5F6),
      Color(0xFF81C784),
      Color(0xFFFFB74D),
      Color(0xFFBA68C8),
      Color(0xFF4DB6AC),
      Color(0xFFF06292),
      Color(0xFF4FC3F7),
      Color(0xFFFFD54F),
    ];
    if (name.isEmpty) return colors[0];
    return colors[name.codeUnitAt(0) % colors.length];
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }
}


