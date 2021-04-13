import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_theme.dart';

part 'loading_dialog.g.dart';

///Contract Loading class widget
abstract class LoadingDialog {
  ///This method called to show widget loading
  void show();

  ///This method called to hide widget loading
  Future<void> hide();
}

///Loading class widget
@Injectable()
class LoadingDialogImpl implements LoadingDialog {
  OverlayEntry _entry;

  /// Loading class for screens such as login and registration
  LoadingDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.white.withOpacity(.3),
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeApp.appColor),
          ),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    _entry.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus.unfocus();
    asuka.addOverlay(_entry);
  }
}
