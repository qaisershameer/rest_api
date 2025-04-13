import 'package:flutter/material.dart';
import 'package:rest_api/models/users_model.dart';

class UserGridItem extends StatelessWidget {
  const UserGridItem(
      {super.key, required this.user, required this.onSelectUser});

  final User user;
  final void Function() onSelectUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectUser,
      child: Container(
        /// Container Decoration
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(71),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          gradient: LinearGradient(
            colors: [
              user.color.withValues(alpha: 0.55),
              user.color.withValues(alpha: 0.90),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        /// User Stack
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            /// User Image
            Positioned(
              right: -30,
              top: -15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image.asset(
                  user.image,
                  width: 70,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// User Title
            Positioned(
              bottom: 1,
              left: 0,
              right: 0, // optional to make sure text takes full width
              child: Text(
                user.title,
                maxLines: 2,
                // textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
