import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/bloc/charges_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/view/charges_page.dart';

const maxWidth = 500.0;

class ChargesItem extends StatefulWidget {
  const ChargesItem({
    super.key,
    required this.type,
    required this.billable,
  });

  final BillableTypeEnum type;
  final BillableInfoLevelItem billable;

  @override
  State<ChargesItem> createState() => _BillableItemState();
}

class _BillableItemState extends State<ChargesItem> {
  bool isSelected = false;

  late Color color;
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    color = widget.type.color;
    isDarkMode = context.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargesBloc, ChargesState>(
      builder: (context, state) {
        isSelected = state.selectedBillableItems.contains(widget.billable);

        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColoredBox(
                        color: color,
                        child: Center(
                          child: Text(widget.type.letter)
                              .color(Colors.white)
                              .paddingSymmetric(horizontal: 8),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            _header(),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  _itemQuantity(),
                                  const VerticalDivider(
                                    width: 3,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        _rateBody(),
                                        if (!(widget.billable
                                                .billableitem_isbillable ??
                                            false))
                                          const Text('Not billable')
                                              .fontSize(12)
                                              .paddingOnly(
                                                right: 8,
                                                bottom: 8,
                                              ),
                                        if (widget.billable
                                                    .billableitem_supplier_contact_name !=
                                                null &&
                                            widget
                                                .billable
                                                .billableitem_supplier_contact_name!
                                                .isNotEmpty)
                                          ColoredBox(
                                            color: Colors.black,
                                            child: Text(
                                              'Supplier: '
                                              '''${widget.billable.billableitem_supplier_contact_name}''',
                                            )
                                                .fontSize(12)
                                                .color(Colors.white)
                                                .paddingSymmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _footer(),
            ],
          ),
        );
      },
    );
  }

  Widget _header() {
    return Container(
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '''${widget.billable.billableitem_code != null ? '${widget.billable.billableitem_code} -' : ''} '''
              '${widget.billable.billableitem_name}',
              overflow: TextOverflow.ellipsis,
            ).paddingSymmetric(horizontal: 6),
          ),
          Checkbox(
            value: isSelected,
            visualDensity: VisualDensity.compact,
            onChanged: (val) {
              context.read<ChargesBloc>().add(
                    ChargesSelectBillableItemEvent(
                      billableItem: widget.billable,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _rateBody() {
    final up = context.read<MainMenuBloc>().state;

    final isBuyVisible = up.userPermissions.isChargeBuyPricesVisible &&
        up.isChargeDetailsVisible;
    final isSellVisible = up.userPermissions.isChargeSellPricesVisible &&
        up.isChargeDetailsVisible;

    final unitString = widget.billable.billableitem_unit_string;
    final buyPrice =
        widget.billable.billableitem_buy_price?.toCommaString() ?? '0';
    final sellPrice =
        widget.billable.billableitem_sell_price?.toCommaString() ?? '0';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.billable.billableitem_description != null &&
                  widget.billable.billableitem_description!.trim().isNotEmpty)
                Text('${widget.billable.billableitem_description}'),
              if (isBuyVisible)
                Text(
                  'Buy: \$$buyPrice '
                  '''${unitString != null && unitString.isNotEmpty ? '/ $unitString' : ''}''',
                ),
              if (isSellVisible)
                Text(
                  'Buy: \$$sellPrice '
                  '''${unitString != null && unitString.isNotEmpty ? '/ $unitString' : ''}''',
                ),
            ],
          ),
        ),
        if (widget.type == BillableTypeEnum.product &&
            up.isChargeDetailsVisible) ...{
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey.shade300,
                  ),
                ),
            child: const Text('Tag').color(
              Colors.black,
            ),
          )
        }
      ],
    ).paddingAll(8);
  }

  Widget _footer() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.billable.billableitem_updated_by_contact_name_display} '
            '''at ${widget.type == BillableTypeEnum.time ? DateFormat('d MMM yyyy').format(widget.billable.billableitem_start!) : DateFormat('d MMM yyyy h:mma').format(widget.billable.billableitem_created_date!.toUtc())}''',
            style: NMTextStyles.b2(context)?.copyWith(
              fontSize: 12,
            ),
          ),
          if (context.read<MainMenuBloc>().state.isChargeDetailsVisible &&
              widget.billable.billableitem_sell_subtotal != null)
            PriceTag(
              price:
                  '''\$${widget.billable.billableitem_sell_subtotal!.toCommaString()}''',
              paddingLeft: 22,
              color: color,
            ),
        ],
      ),
    );
  }

  Widget _itemQuantity() {
    final quantity = widget.billable.billableitem_quantity ?? 0;

    final parsedQuantity = quantity.toStringAsFixed(
      quantity.truncateToDouble() == quantity ? 0 : 2,
    );

    var unit = widget.billable.billableitem_unit_string ?? '';

    if (quantity > 1 && unit.isNotEmpty) {
      unit = '${unit}s';
    }

    return SizedBox(
      // height: double.infinity,
      width: 50,
      child: Center(
        child: unit.isEmpty
            ? Text(
                '$quantity',
              ).fontSize(20)
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: parsedQuantity,
                  style: NMTextStyles.b2(context)?.copyWith(
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '\n$unit',
                      style: NMTextStyles.b2(context)?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.price,
    required this.color,
    this.paddingLeft = 18,
    this.tipWidth = 0.2,
  });
  final String price;
  final Color color;
  final double paddingLeft;
  final double tipWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomPaint(
          painter: PriceTagShape(
            color: color,
            tipWidth: tipWidth,
          ),
          size: Size(constraints.maxWidth, constraints.maxHeight),
          child: Padding(
            padding: EdgeInsets.fromLTRB(paddingLeft, 4, 4, 4),
            child: Text(
              price,
              style: NMTextStyles.b2(context)?.copyWith(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PriceTagShape extends CustomPainter {
  PriceTagShape({
    required this.color,
    required this.tipWidth,
  });
  final Color color;
  final double tipWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Top-left point of the rectangle
      ..lineTo(size.width, 0) // Top-right point of the rectangle
      ..lineTo(size.width, size.height) // Bottom-right point of the rectangle
      ..lineTo(0, size.height) // Bottom-left point of the rectangle
      ..lineTo(
        size.width * tipWidth,
        size.height * 0.5,
      ) // Inward point of the triangle
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
