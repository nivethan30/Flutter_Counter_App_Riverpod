import 'package:flutter/material.dart';

/// Builds a [SizedBox] containing a [FloatingActionButton].
///
/// The [iconData] parameter specifies the icon to be used for the button.
///
/// The [onPressed] parameter specifies the callback that will be called when the
/// button is pressed.
///
/// The [heroTag] parameter specifies the tag that will be used in the transition
/// animation when this button is pressed.
///
/// The [tooltip] parameter specifies the text that will be displayed when the
/// button is long pressed.
///
/// The returned [SizedBox] will have a height and width of 70.
///
/// This function is intended to be used to create a button that will be used in
/// a [FloatingActionButtonLocation.endFloat] or
/// [FloatingActionButtonLocation.endDocked].
SizedBox floatingActionButtons(
    {required IconData iconData,
    required VoidCallback? onPressed,
    required String heroTag,
    required String tooltip}) {
  return SizedBox(
    height: 70,
    width: 70,
    child: FloatingActionButton(
      heroTag: heroTag,
      tooltip: tooltip,
      onPressed: onPressed,
      child: Icon(iconData),
    ),
  );
}
