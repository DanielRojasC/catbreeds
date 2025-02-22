import 'package:catbreeds/app/bloc/breed_bloc/breed_bloc.dart';
import 'package:catbreeds/app/data/repositories/breed_repository_impl.dart';
import 'package:catbreeds/app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsApp extends StatefulWidget {
  const CatBreedsApp({super.key});

  @override
  State<CatBreedsApp> createState() => _CatBreedsAppState();
}

class _CatBreedsAppState extends State<CatBreedsApp> {
  final catRepository = BreedRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => BreedBloc(
            catRepository: catRepository,
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
