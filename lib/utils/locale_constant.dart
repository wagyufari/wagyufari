import 'package:wagyufari/core/prefs/prefs.dart';

class LocaleConstant{
  String
      AN_APP_THAT_DIGITALIZES_RESTAURANT_MENUS_TO_HELP_WITH_LONG_QUEUES_OR_STORE_CATALOGUES_AT_AN_AFFORDABLE_PRICE =
      Prefs.getLanguage() == "en"
          ? "An app that digitalizes Restaurant Menus to help with long queues or store catalogues all at an affordable price"
          : "Aplikasi yang mendigitalisasi Menu Restoran untuk membantu antrian atau Katalog Toko, semua dengan harga yang terjangkau";
  String ORDERING_MADE_EASY = Prefs.getLanguage() == "en" ? "Ordering made easy" : "Pemesanan menjadi mudah";
  String CONTINUE_WITH_GOOGLE = Prefs.getLanguage() == "en" ? "Continue with Google" : "Lanjutkan dengan Google";
  String CONTINUE_WITH_EMAIL = Prefs.getLanguage() == "en" ? "Continue with Email" : "Lanjutkan dengan Email";
  String CONTINUE_WITHOUT_SIGNING_IN = Prefs.getLanguage() == "en" ? "Continue without signing in" : "Lanjutkan tanpa sign in";
  String ASDF = Prefs.getLanguage() == "en" ? "ASDF" : "ASDF";
}
