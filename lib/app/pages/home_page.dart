import 'package:catbreeds/app/bloc/breed_bloc/breed_bloc.dart';
import 'package:catbreeds/app/domain/entities/breed_entity.dart';

import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:catbreeds/app/widgets/breed/breed_list_widget.dart';
import 'package:catbreeds/app/widgets/loading_widget.dart';
import 'package:catbreeds/app/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchInputController = TextEditingController();

  List<BreedEntity> _breedsList = [];
  List<BreedEntity> _breedlistFiltered = [];

  @override
  void initState() {
    super.initState();
    _searchInputController.addListener(_searchInputListener);
    BlocProvider.of<BreedBloc>(context).add(FetchBreedsEvent());
  }

  void _searchInputListener() => BlocProvider.of<BreedBloc>(context).add(
        FilterBreedsListEvent(
          searchText: _searchInputController.text,
          breedsList: _breedsList,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: deviceWidth(context),
          height: deviceHeight(context),
          child: BlocBuilder<BreedBloc, BreedState>(
            builder: (context, state) {
              if (state is BreedLoadingState) {
                return LoadingWidget();
              } else if (state is BreedFetchedState) {
                _breedsList = state.cats;
                _breedlistFiltered = state.cats;
                BlocProvider.of<BreedBloc>(context).add(BreedInitialEvent());
              } else if (state is BreedListFilteredState) {
                _breedlistFiltered = state.breedsFilteredList;

                BlocProvider.of<BreedBloc>(context).add(BreedInitialEvent());
              }

              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Catbreeds",
                        style: Styles.basicTextStyle(20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SearchInputWidget(
                          controller: _searchInputController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: _breedlistFiltered.isEmpty
                            ? Center(
                                child: Text(
                                  "No breeds data founded...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : BreedListWidget(
                                breedList: _breedlistFiltered,
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
