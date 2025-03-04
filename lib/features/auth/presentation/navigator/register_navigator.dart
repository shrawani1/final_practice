import 'package:final_practice/app/navigator/navigator.dart';
import 'package:final_practice/features/auth/presentation/view/register_view.dart';


// This class will call any view I call
class RegisterViewNavigator {}

// Anyone who want to call register view
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
