import 'package:stepel_flutter/feature/permissions/presentation/widgets/permissions_buttons.dart';
import 'package:stepel_flutter/feature/permissions/presentation/widgets/permissions_icon.dart';
import 'package:stepel_flutter/feature/permissions/presentation/widgets/permissions_sub_title.dart';
import 'package:stepel_flutter/feature/permissions/presentation/widgets/permissions_title.dart';
import 'package:stepel_flutter/imports.dart';

@RoutePage()
class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: Sizes.permissionsPagePadding,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PermissionsIcon(),
              SizedBox(height: 20),
              PermissionsTitle(),
              SizedBox(height: 20),
              PermissionsSubTitle(),
            ],
          ),
          PermissionsButtons()
        ],
      ),
    ));
  }
}







// class ButtonsRow extends StatelessWidget {
//   const ButtonsRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, children: [
//       RejectButton(),
//       ConfirmButton(),
//     ]);
//   }
// }

// class RejectButton extends StatelessWidget {
//   const RejectButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => SystemNavigator.pop(),
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
//         overlayColor: MaterialStateProperty.all<Color>(Colors.blue.shade200),
//         elevation: MaterialStateProperty.all<double?>(0),
//       ),
//       child: Text(
//         context.localization.permissionsPageRejectButtonText,
//         style: TextStyle(color: Colors.blue.shade800),
//       ),
//     );
//   }
// }

// class ConfirmButton extends StatelessWidget {
//   const ConfirmButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         var permissionsGranted = await PermissionsService.checkPermissions();
//         LocalStorageService.instance.setPermissionsGranted(permissionsGranted);
//         if (permissionsGranted && context.mounted) {
//           context.router.replaceNamed('/main');
//         }
//       },
//       style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade800)),
//       child: Text(context.localization.permissionsPageConfirmButtonText),
//     );
//   }
// }

// Padding(
//             padding: Sizes.permissionsPagePadding,
//             child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ScreenIcon(),
//                   SizedBox(height: 20),
//                   Title(),
//                   SizedBox(height: 20),
//                   SubTitle(),
//                 ],
//               ),
//               ButtonsRow()
//             ])));
