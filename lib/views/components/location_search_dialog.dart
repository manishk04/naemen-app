import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:naemen/utils/color_constant.dart';

import '../../models/prediction_model.dart';
import '../../view_models/google_map_view_model.dart';

class LocationSearchDialog extends StatelessWidget {
  final void Function(Prediction) onSelection;
  const LocationSearchDialog({super.key, required this.onSelection});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 15.h),
      // padding: EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SizedBox(
          width: 350.w,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                hintText: 'Search for area, street name...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(style: BorderStyle.none, width: 0),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 16.h),
                  child: Icon(
                    Icons.search,
                    size: 24.spMin,
                    color: AppColors.primaryColor,
                  ),
                ),
                hintStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Colors.black87,
              ),
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
              ),
            ),
            suggestionsCallback: (pattern) async {
              return await Get.find<GoogleMapViewModel>()
                  .searchAddressRequest(search: pattern);
            },

            itemBuilder: (context, itemData) {
              return Container(
                color: Colors.black87,
                child: Padding(
                  padding: EdgeInsets.all(10.spMin),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 35.sp,
                        color: AppColors.primaryColor,
                      ),
                      Expanded(
                        child: Text(
                          itemData.description!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            // itemBuilder: (context, Prediction suggestion) {
            //   return Padding(
            //     padding: EdgeInsets.all(10),
            //     child: Row(children: [
            //       Icon(Icons.location_on),
            //       Expanded(
            //         child: Text(suggestion.description!, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline2?.copyWith(
            //           color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 20,
            //         )),
            //       ),
            //     ]),
            //   );
            // },
            onSuggestionSelected: onSelection,
            // onSuggestionSelected: (Prediction suggestion) {
            //   print("My location is " + suggestion.description!);
            //   //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
            //   Get.back();
            // },
          ),
        ),
      ),
    );
  }
}
