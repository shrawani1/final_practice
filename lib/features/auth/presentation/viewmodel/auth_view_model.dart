import 'package:final_practice/core/common/my_snackbar.dart';
import 'package:final_practice/features/auth/domain/entity/auth_entity.dart';
import 'package:final_practice/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_practice/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_practice/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final navigator = ref.read(loginViewNavigatorProvider);
  return AuthViewModel(ref.read(authUseCaseProvider), navigator);
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUseCase, this.navigator) : super(AuthState.initial());

  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;

  void obsurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void login({required String username, required String password}) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.login(username, password);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: "Invalid Credentials", color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Login Successful');
      navigator.openHomeView();
    });
  }

  void openRegisterView() {
    navigator.openRegisterView();
  }

  void register(AuthEntity auth) {}
}
