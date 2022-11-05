import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makit/cubits/user/user_cubit.dart';
import 'package:makit/cubits/user/user_state.dart';
import 'package:makit/data/repositories/user_repository.dart';
import 'package:makit/presentation/error/error_screen.dart';
import 'package:makit/presentation/loading/loading_screen.dart';
import 'package:makit/presentation/users/widgets/custom_appbar.dart';
import 'package:makit/presentation/users/widgets/user_card.dart';

class UsersScreen extends StatefulWidget {
  static const String routeName = '/users';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const UsersScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with SingleTickerProviderStateMixin {
  bool _isAppBarVisible = false;
  bool _firstRun = true;
  late final AnimationController _controller;

   @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(context.read<UserRepository>())..getUsers(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {

          if (state.userStatus == UserStatus.loading) {
            return const LoadingScreen();
          }

          else if (state.userStatus == UserStatus.success) {
            return Scaffold(
              appBar: CustomAppBar(
                controller: _controller,
                visible: _isAppBarVisible,
                firstRun: _firstRun,
                child: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Пользователи',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ),
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels > 60) {
                    setState(() {
                      _isAppBarVisible = true;
                      _firstRun = false;
                    });
                  } else {
                    setState(() {
                      _isAppBarVisible = false;
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Пользователи",
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return UserCard(user: state.users[index]);
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          else if (state.userStatus == UserStatus.error) {
            return const ErrorScreen();
          }

          return Container();
        },
      ),
    );
  }
}