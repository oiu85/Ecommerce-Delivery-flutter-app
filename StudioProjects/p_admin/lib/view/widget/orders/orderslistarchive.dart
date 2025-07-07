
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:p_admin/data/model/users_model.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    UsersModel? user = controller.users.firstWhereOrNull(
          (u) => u.usersId.toString() == listdata.ordersUsersid.toString(),
    );
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${"129".tr}${listdata.ordersId}", //Order number is
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "ciro",
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  " ${Jiffy.parse(listdata.ordersDatetime!).fromNow()} ",
                  style: const TextStyle(
                    fontFamily: "ciro",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    icon: Icons.shopping_bag_outlined,
                    title: "130".tr,
                    value: controller.printOrderType(listdata.ordersType!.toString()),
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.attach_money,
                    title: "131".tr,
                    value: "${listdata.ordersPrice}\$",
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.delivery_dining,
                    title: "132".tr,
                    value: "${listdata.ordersPricedelivery}\$",
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.payment,
                    title: "133".tr,
                    value: controller.printPaymentMethod(listdata.ordersPaymrntmethod!.toString()),
                  ),
                  const Divider(height: 16),
                  _buildStatusRow(
                    title: "134".tr,
                    value: controller.printOrdersStatus(listdata.ordersStatus!.toString()),
                    status: listdata.ordersStatus!.toString(),
                  ),

                  const Divider(height: 16),
                  if (user != null)
                    _buildInfoRow(
                      icon: Icons.person,
                      title: "User",
                      value: user.usersName ?? "No Name",
                    ),
                  if (listdata.ordersRating != 0)
                    Row(
                      children: [
                        Text(
                          "Rating :",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "ciro",
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          listdata.ordersRating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "ciro",
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                title: const Text(
                                  "User Comment",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ciro",
                                  ),
                                ),
                                content: Text(
                                  listdata.ordersNoterating!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "ciro",
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text("Close"),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Show Comment",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: "ciro",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF00FF3C).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: AppColor.secondColor,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${"135".tr} ${listdata.ordersTotalprice!.round()}\$",
                        style: const TextStyle(
                          fontFamily: "ciro",
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ),
                const Spacer(),

                   ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(AppRoute.ordersdetails, arguments: {
                          "ordersmodel": listdata,
                          "users": user,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.visibility),
                      label: Text("136".tr, overflow: TextOverflow.ellipsis),
                   ),

                // const SizedBox(width: 6),
                // if(listdata.ordersRating == 0.0)   Flexible(
                //   child: ElevatedButton.icon(
                //     onPressed: () {
                //       ShowDilaogRating(context,listdata.ordersId!.toString());
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.secondColor,
                //       foregroundColor: Colors.white,
                //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     icon: const Icon(Icons.star_rate),
                //     label: Text("Rating", overflow: TextOverflow.ellipsis),
                //   ),
                // ),
              ],
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildInfoRow({required IconData icon, required String title, required String value}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColor.primaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          "$title ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: "ciro",
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow({required String title, required String value, required String status}) {
    Color statusColor;

    switch (status) {
      case "0":
        statusColor = Colors.blue;
        break;
      case "1":
        statusColor = Colors.green;
        break;
      case "2":
        statusColor = Colors.orange;
        break;
      case "3":
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      children: [
        const Icon(
          Icons.info_outline,
          size: 18,
          color: AppColor.primaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          "$title ",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Container(
          width: Get.width * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: statusColor,
            ),
          ),
        ),
      ],
    );
  }
}