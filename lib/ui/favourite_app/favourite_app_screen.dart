import "package:bloc_study/bloc/favourite_app/favourite_app_bloc.dart";
import "package:bloc_study/bloc/favourite_app/favourite_app_event.dart";
import "package:bloc_study/bloc/favourite_app/favourite_app_state.dart";
import "package:bloc_study/model/favourite_app/favourite_item_model.dart";
import "package:bloc_study/repository/favourite_app/favourite_app_repository.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // context.read<FavouriteAppBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavouriteAppBloc(FavouriteAppRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Favourite App")),
        body: SafeArea (
          child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.init:
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<FavouriteAppBloc>().add(
                          FetchFavouriteList(),
                        );
                      },
                      child: const Text("Fetch List"),
                    ),
                  );
                case ListStatus.loading:
                  return Center(child: CircularProgressIndicator());
                case ListStatus.completed:
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 20,),
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteItemList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListTile(
                          title: Text(item.value),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<FavouriteAppBloc>().add(FavouriteItem(item: FavouriteItemModel(id: item.id, value: item.value, isFavourite: !item.isFavourite)));
                            },
                            icon: item.isFavourite ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(13)
                          )  ,
                        ),
                      );
                    },
                  );
                case ListStatus.error:
                  return const Text("Error");
              }
            },
          ),
        ),
      ),
    );
  }
}
