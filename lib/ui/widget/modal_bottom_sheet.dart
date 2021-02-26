import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/core/model/modal_bottom_sheet_item.dart';
import 'package:explore_flutter/ui/shared/style/roboto_style.dart';
import 'package:explore_flutter/ui/shared/style/ubuntu_style.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:flutter/material.dart';

/// This widget is for modal bottom sheet component.
/// Example:
/// ```
/// showModalBottomSheetSkeleton(
///   context: context,
///   headerText: 'Modal Bottom Sheet Skeleton',
///   onSelect: (index) {
///     print(index);
///   },
///   showCloseButton: true,
///   items: List.generate(2,
///         (index) => ModalBottomSheetItem(
///           leadingIconData: Icon(Icons.calendar_today),
///           leadingIconColor: Colors.black,
///           titleText: 'Item $index',
///           checkmarkIconColor: Colors.green,
///           isDisabled: false,
///       )).toList()
/// );
/// ```

class ModalBottomSheetList extends StatefulWidget {
  /// Context is required to show modal bottom sheet.
  final BuildContext context;

  /// Item list in the body of modal bottom sheet.
  /// Use ModalBottomSheetItem class.
  final List<ModalBottomSheetItem> items;

  /// When user pressed the item in the list, it will trigger this function.
  final Function onSelect;

  /// Header modal bottom sheet text.
  final String headerText;

  /// Header modal bottom sheet text color.
  final Color headerTextColor;

  /// Default index on the selected item.
  final int selectedIndex;

  /// Option to hide or show close button at header.
  /// Defaults to false.
  final bool showCloseButton;

  const ModalBottomSheetList(
      {@required this.context,
      @required this.items,
      this.onSelect,
      this.headerText,
      this.headerTextColor,
      this.selectedIndex,
      this.showCloseButton = false})
      : assert(context != null),
        assert(items != null);

  @override
  _ModalBottomSheetListState createState() => _ModalBottomSheetListState();
}

class _ModalBottomSheetListState extends State<ModalBottomSheetList> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ThemeColor.white,
        ),
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (isHeaderEnabled()) _buildHeader(),
            _buildBody()
          ],
        ));
  }

  /// Hide header if it is not specified or an empty string.
  bool isHeaderEnabled() {
    return widget.headerText != null && widget.headerText.isNotEmpty;
  }

  /// Pass the selected item index to onSelect callback.
  void handleOnSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onSelect != null) {
      widget.onSelect(index);
    }
  }

  Widget _buildHeader() {
    return Container(
        height: ConstantMeasurements.heightHeaderModalBottomSheet,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ConstantMeasurements.horizontalPadding,
                      right: widget.showCloseButton
                          ? 0
                          : ConstantMeasurements.horizontalPadding),
                  child: Text(
                    widget.headerText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: UbuntuStyle.h4.copyWith(
                        color: widget.headerTextColor ?? ThemeColor.black),
                  ),
                ),
              ),
              if (widget.showCloseButton)
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: ThemeColor.black,
                    ),
                    onPressed: () => Navigator.pop(context)),
            ]));
  }

  Widget _buildBody() {
    return Flexible(
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.items.length ?? 0,
        itemBuilder: (context, index) {
          return Material(
              color: ThemeColor.white,
              child: InkWell(
                onTap: widget.items[index].isDisabled
                    ? null
                    : () => handleOnSelect(index),
                child: _buildListTile(
                    widget.items[index], index == _selectedIndex ?? false),
              ));
        },
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ConstantMeasurements.horizontalPadding),
          child: Divider(
            color: ThemeColor.lightgrey,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(ModalBottomSheetItem item, bool isSelected) {
    return Container(
      color: item.isDisabled ? ThemeColor.lightgrey : ThemeColor.white,
      child: ListTile(
          leading: item?.leadingIconData != null
              ? Icon(item?.leadingIconData,
                  size: ConstantMeasurements.defaultIconWidth,
                  color: item.isDisabled
                      ? ThemeColor.grey
                      : item?.leadingIconColor ?? ThemeColor.black)
              : null,
          title: Text(item?.titleText ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: RobotoStyle.body2.copyWith(
                  color: item.isDisabled
                      ? ThemeColor.grey
                      : item?.textColor ?? ThemeColor.black)),
          trailing: item?.checkmarkIconColor != null
              ? Visibility(
                  visible: isSelected,
                  child: SizedBox(
                      width: ConstantMeasurements.defaultIconWidth,
                      height: ConstantMeasurements.defaultIconHeight,
                      child: Icon(Icons.done,
                          size: ConstantMeasurements.defaultIconWidth,
                          color: item.checkmarkIconColor)))
              : null),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

void showModalBottomSheetSkeleton({
  @required BuildContext context,
  @required List<ModalBottomSheetItem> items,
  Function onSelect,
  String headerText,
  Color headerTextColor,
  int selectedIndex,
  bool showCloseButton = false,
}) {
  assert(context != null);
  assert(items != null);
  showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return ModalBottomSheetList(
          context: context,
          onSelect: onSelect,
          items: items,
          headerText: headerText,
          headerTextColor: headerTextColor,
          selectedIndex: selectedIndex,
          showCloseButton: showCloseButton,
        );
      });
}
