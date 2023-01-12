import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginRequestEvent(String email, String password) {
    emit(LoginStateLoading());
    if (email == 'fluttertest@swamedia.com' && password == 'fluttertest') {
      emit(LoginStateSuccess(message: 'Berhasil login', password: password,email: email));
    }else{
      emit(LoginStateFailed(message: 'email atau password salah'));
    }
  }
}
