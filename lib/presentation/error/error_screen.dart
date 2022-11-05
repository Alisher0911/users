import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makit/consts/colors.dart';
import 'package:makit/cubits/user/user_cubit.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/error.svg",
              color: purpleColor,
            ),

            const SizedBox(height: 36),

            const Text(
              "Не удалось загрузить информацию",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                context.read<UserCubit>().getUsers();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                minimumSize: Size(MediaQuery.of(context).size.width - 150, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Обновить",
                style: TextStyle(fontSize: 16, color: Colors.white)
              )
            )
          ],
        )
      ),
    );
  }
}