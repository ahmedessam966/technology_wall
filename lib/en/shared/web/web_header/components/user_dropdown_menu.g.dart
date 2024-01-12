part of '../web_header.dart';

class UserDropdownMenu extends StatelessWidget {
  final String? userName;
  final dynamic action;
  final AppControllers app;
  const UserDropdownMenu({super.key, required this.userName, this.action, required this.app});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enableSearch: false,
      requestFocusOnTap: false,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: context.bodyMedium?.copyWith(color: Colors.white70),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: Colors.white70),
        ),
      ),
      label: Text(
        app.utilityPage ?? userName?.split(' ')[0] ?? 'Account',
        style: context.bodyMedium?.copyWith(color: Colors.white70),
      ),
      leadingIcon: const Icon(
        CupertinoIcons.person_crop_circle,
        color: Colors.white70,
      ),
      trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
      selectedTrailingIcon: const Icon(Icons.arrow_drop_up, color: Colors.white70),
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: 'Account',
          label: 'My Account',
          leadingIcon: Icon(
            CupertinoIcons.person_alt,
          ),
        ),
        DropdownMenuEntry(
          value: 'Dark Mode',
          label: 'Dark Mode',
          leadingIcon: Icon(
            CupertinoIcons.moon_fill,
          ),
        ),
        DropdownMenuEntry(
          value: 'Log Out',
          label: 'Log Out',
          leadingIcon: Icon(
            CupertinoIcons.power,
          ),
        ),
      ],
      onSelected: action,
    );
  }
}
