import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:noavant/design_elements/components/my_drawer_tile.dart";
import "package:noavant/features/auth/presentation/cubits/auth_cubit.dart";
import "package:noavant/features/profile/pages/profile_page.dart";
// import "package:noavant/features/profile/presentation/pages/profile_page.dart";


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          
              // Divider line
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
              
              // home tile
              MyDrawerTile(
                title: "Home",
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),
          
              // profile tile
              MyDrawerTile(
                title: "Profile",
                icon: Icons.person,
                onTap: () {
                  // pop menu drawer
                  Navigator.of(context).pop();

                  // get current user ID
                  final user = context.read<AuthCubit>().currentUser;
                  String? uid = user!.uid;

                  // navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(uid: uid),
                    ),
                  );
                },
              ),

              // Search tile

              MyDrawerTile(
                title: "Search",
                icon: Icons.search,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

          
              // settings tile

              MyDrawerTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                },
              ),


              const Spacer(),
          
              // logout tile

              MyDrawerTile(
                title: "Logout",
                icon: Icons.login,
                onTap: () => context.read<AuthCubit>().logout(),
              ),       
            ],
          ),
        ),
      ),
    );
  }
}