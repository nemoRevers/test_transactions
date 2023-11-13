import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/auth_bloc.dart';
import '../components/auth_text_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late final TextEditingController _loginController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.showErrorDialog && state.errorDialogDescription != null) {
          _showErrorDialog(
            LocaleKeys.requestFailed.watchTr(context),
            state.errorDialogDescription ?? '',
            () {
              context.read<AuthBloc>().add(const HideDialog());
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: appColors.primaryBg,
        appBar: AppBar(
          elevation: AppDimens.ELEVATION_0,
          backgroundColor: appColors.secondaryBg,
          title: Text(
            LocaleKeys.auth.watchTr(context),
            style: AppFonts.normal15.copyWith(
              color: appColors.text,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Spacer(),
            AuthTextField(
              placeholder: LocaleKeys.email.watchTr(context),
              controller: _loginController,
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (BuildContext context, AuthState state) {
                final String? loginErrorMessage = state.loginErrorMessage;
                if (loginErrorMessage != null) {
                  return Container(
                    color: appColors.secondaryBg,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.PADDING_4,
                      horizontal: AppDimens.PADDING_14,
                    ),
                    child: Text(
                      loginErrorMessage.watchTr(context),
                      textAlign: TextAlign.left,
                      style: AppFonts.normal15.copyWith(
                        color: appColors.warning,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            Divider(
              height: AppDimens.HEIGHT_0,
              thickness: AppDimens.THICKNESS_1,
              indent: AppDimens.INDENT_16,
              color: AppColors.of(context).divider,
              endIndent: AppDimens.INDENT_16,
            ),
            AuthTextField(
              placeholder: LocaleKeys.password.watchTr(context),
              controller: _passwordController,
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (BuildContext context, AuthState state) {
                final String? passwordErrorMessage = state.passwordErrorMessage;
                if (passwordErrorMessage != null) {
                  return Container(
                    color: appColors.secondaryBg,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.PADDING_4,
                      horizontal: AppDimens.PADDING_14,
                    ),
                    child: Text(
                      passwordErrorMessage.watchTr(context),
                      textAlign: TextAlign.left,
                      style: AppFonts.normal15.copyWith(
                        color: appColors.warning,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: AppDimens.HEIGHT_32,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AppButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                context.read<AuthBloc>().add(LoginEvent(
                                      _loginController.text,
                                      _passwordController.text,
                                    ));
                              },
                        child: Text(
                          LocaleKeys.login.watchTr(context),
                          style: AppFonts.bold16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(
    String title,
    String message,
    VoidCallback onPressed,
  ) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title, style: AppFonts.bold16),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Ok',
                style: AppFonts.normal15.copyWith(
                  color: AppColors.of(context).warning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
