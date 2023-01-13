import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/login/loginViewModel.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final asset = Assets.images;
  final LoginViewModel _viewModel =
      LoginViewModel(null); //todoo: must add login usecase

  void _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUsername(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(asset.loginIc.path),
            const SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p28,
                right: AppPadding.p28,
              ),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputLoginUsername,
                builder: ((context, snapshot) {
                  return TextFormField(
                    controller: _userNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppString.userName,
                      labelText: AppString.userName,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppString.userNameError,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p28,
                right: AppPadding.p28,
              ),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputLoginPassword,
                builder: ((context, snapshot) {
                  return TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: AppString.password,
                      labelText: AppString.password,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppString.passwordError,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p28,
                right: AppPadding.p28,
              ),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputValid,
                builder: ((context, snapshot) {
                  return ElevatedButton(
                      onPressed: (snapshot.data ?? false) ? () =>_viewModel.login() : null,   
                      child: const Text(AppString.login));
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
