import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../providers/provider.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsStream = ref.watch(productsStreamProvider);
    final productService = ref.read(productsServiceProvider.notifier);
    String productname = '';

    return Scaffold(
      body: productsStream.when(
        data: (data) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  child: Card(
                    child: ListTile(
                      subtitle: const Text('click CheckBox if Purchased',
                          style: TextStyle(fontSize: 10)),
                      leading: const Text('Products name:'),
                      title: Text(data[index].name!),
                      trailing: IconButton(
                        icon: Icon(data[index].purchased!
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank),
                        onPressed: () {
                          productService.updateProduct(data[index]);
                        },
                      ),
                    ),
                  ),
                  onDismissed: (_) {
                    productService.deleteProduct(data[index]);
                  },
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        cursorColor: Colors.amber,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => productname = value,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        productService.addProduct(
                            ProductModel(name: productname, purchased: false));
                      },
                      child: const Text('Add'))
                ],
              ),
            )
          ],
        ),
        error: (error, tree) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
