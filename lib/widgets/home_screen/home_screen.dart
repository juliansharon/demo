import 'package:demo/cubits/image_fetch/imagefetch_cubit.dart';
import 'package:demo/widgets/home_screen/error.dart';
import 'package:demo/widgets/home_screen/loader.dart';
import 'package:demo/widgets/home_screen/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagefetchCubit _cubit = ImagefetchCubit();
  @override
  void initState() {
    super.initState();
    _cubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        body: BlocBuilder<ImagefetchCubit, ImagefetchState>(
          builder: (context, state) {
            if (state is ImagefectchLoading) {
              return const Loader();
            }
            if (state is ImageFetchError) {
              return const ErrorPage();
            }
            if (state is ImagefetchLoaded) {
              return MainView(data: state.resultdata);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
