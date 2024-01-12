part of '../web_header.dart';

class NavBarButton extends StatelessWidget {
  final String title;
  final String? backupTitle;
  final dynamic action;
  final AppControllers app;
  const NavBarButton({super.key, required this.title, this.action, this.backupTitle, required this.app});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.white10;
          } else {
            return null;
          }
        }),
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return LinearBorder.bottom(
              side: const BorderSide(color: Colors.white54),
            );
          } else if (backupTitle == null
              ? app.pageTitle.endsWith(title)
              : app.pageTitle.endsWith(title) || app.pageTitle.endsWith(backupTitle!)) {
            return LinearBorder.bottom(
              size: 0.5,
              side: const BorderSide(
                color: Colors.white,
              ),
            );
          } else {
            return const LinearBorder(
              side: BorderSide(color: Colors.transparent),
            );
          }
        }),
      ),
      onPressed: action,
      child: Text(title, style: context.bodyLarge?.copyWith(color: Colors.white)),
    );
  }
}
