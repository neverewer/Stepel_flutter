import 'package:stepel_flutter/imports.dart';

class InfoBox extends StatefulWidget {
  final String label;
  final String value;
  final bool isActive;
  final Function()? onTap;

  const InfoBox({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.isActive = true,
  });

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  final FocusNode _focusNode = FocusNode();
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _selected = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.isActive
            ? () {
                FocusScope.of(context).requestFocus(_focusNode);
                if (widget.onTap != null) {
                  widget.onTap!.call();
                }
              }
            : null,
        child: SizedBox(
          height: Sizes.profilePageInfoBoxHeight,
          width: Sizes.profilePageInfoBoxWidth,
          child: Stack(
            children: [
              InfoBoxBorder(selected: _selected, isActive: widget.isActive),
              InfoBoxLabel(label: widget.label, selected: _selected, isActive: widget.isActive),
              InfoBoxContent(value: widget.value, isActive: widget.isActive)
            ],
          ),
        ));
  }
}

class InfoBoxBorder extends StatelessWidget {
  const InfoBoxBorder({super.key, required this.selected, required this.isActive});
  final bool selected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        top: 6,
        left: 0,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                color: selected
                    ? context.theme.extension<ProfileInfoBoxTheme>()!.borderSelectedColor
                    : isActive
                        ? context.theme.extension<ProfileInfoBoxTheme>()!.borderActiveColor
                        : context.theme.extension<ProfileInfoBoxTheme>()!.borderUnactiveColor,
                width: selected ? 2 : 1,
              )),
        ));
  }
}

class InfoBoxLabel extends StatelessWidget {
  const InfoBoxLabel({super.key, required this.label, required this.selected, required this.isActive});
  final String label;
  final bool selected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 2,
        left: 15,
        child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(label,
                    style: TextStyle(
                      color: selected
                          ? Colors.blue
                          : isActive
                              ? context.theme.extension<ProfileInfoBoxTheme>()!.contentActiveColor
                              : context.theme.extension<ProfileInfoBoxTheme>()!.contentUnactiveColor,
                      fontSize: 12,
                    )))));
  }
}

class InfoBoxContent extends StatelessWidget {
  const InfoBoxContent({super.key, required this.value, required this.isActive});
  final String value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        left: 10,
        top: 6,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isActive
                          ? context.theme.extension<ProfileInfoBoxTheme>()!.contentActiveColor
                          : context.theme.extension<ProfileInfoBoxTheme>()!.contentUnactiveColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: isActive
                        ? context.theme.extension<ProfileInfoBoxTheme>()!.contentActiveColor
                        : context.theme.extension<ProfileInfoBoxTheme>()!.contentUnactiveColor,
                  )
                ],
              ),
            )));
  }
}
