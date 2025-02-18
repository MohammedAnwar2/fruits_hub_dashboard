import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/dummy/advertizement_dummy_data.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/view_and_delete_advertisement_cubit/view_and_delete_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_list_view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvertisementListViewBlocConsumer extends StatelessWidget {
  const AdvertisementListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        BlocProvider.of<ViewAndDeleteAdvertisementCubit>(context);
    return BlocConsumer<ViewAndDeleteAdvertisementCubit,
        ViewAndDeleteAdvertisementState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      switch (state) {
        case ViewAndDeleteAdvertisementInitial():
          return SizedBox();
        case ViewAdvertisementLoading():
          return Skeletonizer(
            enabled: true,
            child:
                AdvertisementListViewItem(advertisements: dummyAdvertisements),
          );
        case DeleteAdvertisementLoading():
          return CustomModalProgressHUD(
            inAsyncCall: true,
            child: AdvertisementListViewItem(
                advertisements:
                    controller.advertisementListEntity.advertisements),
          );
        case ViewAdvertisementSuccess():
          if (state.advertisements.isEmpty) {
            return Center(child: Text('No advertisements found'));
          } else {
            return AdvertisementListViewItem(
                advertisements: state.advertisements);
          }
        case DeleteAdvertisementSuccess():
         if (controller.advertisementListEntity.advertisements.isEmpty) {
            return Center(child: Text('No advertisements found'));
          } else {
            return AdvertisementListViewItem(
                advertisements: controller.advertisementListEntity.advertisements);
          }
        case ViewAndDeleteAdvertisementFailure():
          return Center(child: Text(state.errorMessage));
      }
    });
  }
}
