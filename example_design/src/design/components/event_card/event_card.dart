import 'package:example_design/design/components/chip_list/chip_list.dart';
import 'package:example_design/design/design.theme.dart';
import 'package:example_design/design/elements/buttons/image_button/image_button.dart';
import 'package:example_design/design/elements/chip/chip.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../constants/utils.dart';
import '../../elements/buttons/link_button/link_button.dart';
import 'event_card.style.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.place,
    required this.since,
    required this.until,
    this.width = 400,
    this.height = 122,
    this.chips = const [],
    this.tooMuchInfo = false,
    this.onTap,
    this.style,
  });

  final String title;
  final String place;
  final double width;
  final double height;
  final DateTime since;
  final DateTime until;
  final bool tooMuchInfo;
  final List<Chip> chips;
  final GestureTapCallback? onTap;
  final EventCardStyle? style;

  Widget leftPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 15, bottom: 15),
      child: Container(
        padding: EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: DesignColors.grey400.withAlpha(50),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${since.day}. ${since.month}.',
              style: TextStyle(
                fontFamily: TextFonts.inter,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text(
              since.year.toString(),
              style: TextStyle(
                fontFamily: TextFonts.inter,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Od: ${since.hour}:${since.minute}',
              style: TextStyle(
                fontFamily: TextFonts.inter,
                fontWeight: FontWeight.w400,
                color: DesignColors.grey400,
                fontSize: 11,
              ),
            ),
            Text(
              'Do: ${since.hour}:${since.minute}',
              style: TextStyle(
                fontFamily: TextFonts.inter,
                fontWeight: FontWeight.w400,
                color: DesignColors.grey400,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget middlePart() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 8),
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place,
            style: TextStyle(
              fontFamily: TextFonts.inter,
              fontWeight: FontWeight.w400,
              color: DesignColors.grey400,
              fontSize: 11,
            ),
            maxLines: 2,

            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 1),
          Text(
            Utils.truncateWithEllipsis(title, 44),
            style: TextStyle(
              fontFamily: TextFonts.inter,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 8),
          if (chips.isEmpty)
            SizedBox(height: 20, width: 190)
          else
            ChipList(
              width: 190,
              padding: EdgeInsets.zero,
              chips: chips,
            ),
        ],
      ),
    );
  }

  Widget rightPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 6),
          child: ImageButton(
            onTap: () {},
            size: Size(34, 34),
            child: Padding(
              padding: const EdgeInsets.only(top: 2, left: 1),
              child: Icon(Icons.heart_broken, size: 24),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: LinkButton(
            text: "Detail",
            width: 64,
            gap: 2,
            onTap: () {},
            leadingIcon: false,
            icon: Icons.chevron_right,
            style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(
              iconSize: 24,
              textSize: 13,
              iconColor: DesignColors.grey400,
              textColor: DesignColors.grey400,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height + (tooMuchInfo ? 24 : 0),
        decoration: currentStyle.decoration,
        child: Row(
          children: [
            leftPart(),
            middlePart(),
            rightPart(context),
          ],
        ),
      ),
    );
  }
}
