import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_controller.dart';
import 'package:simplibuy/authentication/presentation/screens/login/login_screen.dart';
import 'package:simplibuy/core/state/state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        builder: (controller) => Flexible(child: start(controller)));
  }

  Widget start(LoginScreenController controller) {
    if (controller.state is FinishedState) {
      return Container();
    } else if (controller.state is LoadingState) {
      return waitingView();
    } else if (controller.state is ErrorState) {
      return const Text("Error");
    } else {
      return const LoginForm();
    }
  }

  Widget waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
