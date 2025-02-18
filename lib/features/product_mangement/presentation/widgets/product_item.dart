import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/view_and_delete_cubit/view_and_delete_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/update_products_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });
  final ProductEntities product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(onPressed: () {
        context.read<ViewAndDeleteCubit>().deleteProduct(productEntity: product);
      }, icon: Icon(Icons.delete)),
      title: Text(product.productName),
      subtitle: Text(product.productPrice.toString()),
      trailing: Image.network(product.imageUrl!),
      onTap: () async{
      final result =  await  Navigator.pushNamed(context, UpdateProductsView.routeName, arguments: product);
       if(result == true){
            context.read<ViewAndDeleteCubit>().viewProducts();
          }else if(result == false){
            showEffectEventMessage(context, 'No changes were made to the product');
          }
      },
    );
  }
}