import 'package:bloc/bloc.dart';
import '../my_accounts_page.dart';
import '../scans/main_scanner_page.dart';

enum NavigationEvents {
  AddOnQRClickedEvent,
  UseOnQRClickedEvent,
  InProductionClickedEvent,
  UserAccountClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => MyAccountsPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.AddOnQRClickedEvent:
        yield MainPage();
        break;
      case NavigationEvents.UserAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.UseOnQRClickedEvent:
       // yield MyOrdersPage();
        break;
      case NavigationEvents.InProductionClickedEvent:
      // yield MyOrdersPage();
        break;
    }
  }
}