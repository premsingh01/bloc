import 'package:bloc_study/bloc/product_page/product_page_bloc.dart';
import 'package:bloc_study/bloc/product_page/product_page_event.dart';
import 'package:bloc_study/bloc/product_page/product_page_state.dart';
import 'package:bloc_study/repository/product_page/product_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPageScreen extends StatelessWidget {
  const ProductPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ProductPageBloc>().add(FetchProduct());
    return BlocProvider(
      create: (_) => ProductPageBloc(ProductPageRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Product Page")),
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductPageBloc>().add(FetchProduct());
            
              },
              child: BlocBuilder<ProductPageBloc, ProductPageState>(
                builder: (context, state) {
                  switch (state) {
                    case ProductPageInitialState():
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ProductPageBloc>().add(FetchProduct());
                          },
                          child: const Text("Fetch Products"),
                        ),
                      );
                    case ProductPageLoadingState():
                      return Center(child: CircularProgressIndicator());
                    case ProductPageCompletedState():
                      return ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 15),
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          final item = state.productList[index];
                          return Card(
                            color: Colors.grey.shade300,
                            margin: const EdgeInsets.all(15),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Id:\t",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: item.id.toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Title: ${item.title}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text("Price: 22.3"),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Description: ${item.description}"
                                  ),
                                  const SizedBox(height: 10),
                                  Text("Category: ${item.category}"),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text("Image: "),
                                      const SizedBox(width: 10),
                                      CircleAvatar(
                                        child: Image.network(
                                          item.image ?? "",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("rate: ${item.rating?.rate ?? 0.0}"),
                                  const SizedBox(height: 10),
                                  Text("count: ${item.rating?.count ?? 0}"),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    case ProductPageFailureState():
                      return const Text("Something went wrong");
                  }
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
