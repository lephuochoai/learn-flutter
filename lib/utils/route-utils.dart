enum APP_PAGE { login, home, splash, main, settings }

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.main:
        return "/";
      case APP_PAGE.home:
        return "/home";
      case APP_PAGE.login:
        return "/login";
      case APP_PAGE.splash:
        return "/splash";
      case APP_PAGE.settings:
        return "/settings";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case APP_PAGE.main:
        return "MAIN";
      case APP_PAGE.home:
        return "HOME";
      case APP_PAGE.login:
        return "LOGIN";
      case APP_PAGE.splash:
        return "SPLASH";
      case APP_PAGE.settings:
        return "SETTINGS";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case APP_PAGE.main:
        return "Main App";
      case APP_PAGE.home:
        return "My App";
      case APP_PAGE.login:
        return "My App Log In";
      case APP_PAGE.splash:
        return "Splash screen";
      case APP_PAGE.settings:
        return "Settings screen";

      default:
        return "My App";
    }
  }
}
