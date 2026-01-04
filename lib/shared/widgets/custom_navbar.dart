import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
// Importez votre écran de paramètres ici (ajustez le chemin si nécessaire)
// import '../../features/settings/settings_screen.dart'; 

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.symmetric(vertical: 8), // Réduit pour laisser place aux boutons
      decoration: BoxDecoration(
        color: AppColors.navBarBlack,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.grid_view_rounded, color: AppColors.primaryOrange),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.folder_open, color: Colors.white54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white54),
            onPressed: () {},
          ),
          // BOUTON PARAMÈTRES
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white54),
            onPressed: () {
              // Décommenter quand la page SettingsScreen sera créée
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              */
            },
          ),
        ],
      ),
    );
  }
}