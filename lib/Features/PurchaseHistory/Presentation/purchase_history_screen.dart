import 'package:distech_technology/Commons/app_icons.dart';
import 'package:distech_technology/Widgets/custom_text_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../Commons/app_colors.dart';
import '../../../Commons/app_sizes.dart';
import '../../../Widgets/custom_divider.dart';
import '../../SoldTicket/Models/ticket_item_model.dart';
import '../../SoldTicket/Widgets/ticket_list_item.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  //Variable Declarations
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Hide the onscreen keyboard on outside touch.
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSizes.kDefaultPadding,
              ),
              Text(
                'Purchase History',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: AppSizes.kDefaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                      controller: _searchController,
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        EvaIcons.searchOutline,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      maxLines: 1,
                      minLines: 1,
                      isBorder: false,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.kDefaultPadding / 1.5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          const EdgeInsets.all(AppSizes.kDefaultPadding / 1.5),
                      height: AppSizes.buttonHeight + 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppSizes.cardCornerRadius / 2),
                          border: Border.all(color: AppColors.bg)),
                      child: Image.asset(
                        AppIcons.calenderIcon,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.kDefaultPadding * 1.2,
              ),
              Text(
                'Purchase History on 15/09/2025',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: AppSizes.kDefaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSizes.cardCornerRadius / 2),
                  border: Border.all(color: AppColors.bg),
                ),
                child: Container(
                  color: AppColors.primaryBg,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Lot No',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color:
                                            AppColors.darkGrey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'SEM',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              AppColors.darkGrey.withOpacity(0.8),
                                          fontWeight: FontWeight.w500),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Quantity',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              AppColors.darkGrey.withOpacity(0.8),
                                          fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ),
                      const CustomDivider(),
                      Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.4,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: RawScrollbar(
                            thumbColor: AppColors.primary,
                            thickness: 3,
                            radius:
                                const Radius.circular(AppSizes.cardCornerRadius),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ticketItemList.length - 17,
                                itemBuilder: ((context, index) {
                                  return TicketListItem(
                                      ticketItemModel: ticketItemList[index],
                                      itemIndex: index);
                                })),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}