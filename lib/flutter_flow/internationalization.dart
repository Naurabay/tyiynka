import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ky', 'ru'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? kyText = '',
    String? ruText = '',
  }) =>
      [kyText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Details03ProductFood
  {
    'b8epbdng': {
      'ky': 'Стереотиптерди    тандагыңыз',
      'ru': 'Выберите стереотипы',
    },
    'c9gv5qqr': {
      'ky': '“Аялдардын саясатта кылчу иши жок”',
      'ru': '«Женщинам нечего делать в политике»',
    },
    'mdzrey1x': {
      'ky': '“Акылай акылдуу кыз”',
      'ru': '\"Умная девушка\"',
    },
    '1c4ep6c0': {
      'ky': '“Бул чөлкөмдүн жашоочулары куу”',
      'ru': '«Жители этого края хитрые»',
    },
    'umoimg8t': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // Onboarding1
  {
    'eai6fmhp': {
      'ky': 'Cалам!',
      'ru': 'Привет!',
    },
    'kw3lhifz': {
      'ky': 'Баштайлы !',
      'ru': 'Давайте начнем!',
    },
    'kudfy4tw': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // quiz_template
  {
    'jms8nfdm': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // quiz_finished
  {
    'v73xjo1d': {
      'ky': 'Тест',
      'ru': 'Тест',
    },
    '1d0rjm3v': {
      'ky': 'Өзүңөрдү текшергени даярсыңарбы?',
      'ru': 'Вы готовы проверить себя?',
    },
    'cgi82tq9': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // quiz_list_page
  {
    'luey5lao': {
      'ky': 'Жеткиликтүү  материал',
      'ru': 'Доступный материал',
    },
    '3nbyf4kr': {
      'ky': 'мүнөт\n',
      'ru': 'минута',
    },
    '6ss6a5h0': {
      'ky': '🪙',
      'ru': '🪙',
    },
    'b9s6ljgy': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // balance
  {
    'tpuigaky': {
      'ky': 'Капчык балансы',
      'ru': 'Баланс кошелька',
    },
    'cnsjsoxd': {
      'ky': 'Акчаны чыгаруу',
      'ru': 'Вывод денег',
    },
    'lpks79s8': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // Details03ProductFood3
  {
    'leqg5tnp': {
      'ky': 'Кандай стереотипти сиз билесиз?',
      'ru': 'Какой стереотип вы знаете?',
    },
    '1jrkyrf7': {
      'ky': 'Бул жерге жазыныз',
      'ru': 'Этикетка здесь...',
    },
    'n65geyt3': {
      'ky': 'Бүтүрүү',
      'ru': 'Закончилось',
    },
    'm8ltjw4w': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // Details03ProductFood2
  {
    'nq84hjo8': {
      'ky': 'Кастык тил - бул ...',
      'ru': 'Ненавистническая речь - это...',
    },
    'kcm28ycz': {
      'ky':
          'адамды этникалык, диний, жыныстык, расалык, социалдык белгилерине карата кемсинтүүгө, басынтууга, агрессияга багытталган кайсы форматтагы болбосун басынтуучу коммуникация.',
      'ru':
          'оскорбительное общение в любом формате, направленное на оскорбление, унижение, агрессию в отношении человека в связи с его национальными, религиозными, половыми, расовыми, социальными признаками.',
    },
    'jc63zwsk': {
      'ky': 'сабырдуулук',
      'ru': 'терпение',
    },
    'qltsytik': {
      'ky':
          'аялдар жана эркектер жашаган социалдык, маданий, экономикалык жана саясий контексттерди эске алган мамилени билдирет.',
      'ru':
          'относится к подходу, учитывающему социальные, культурные, экономические и политические условия, в которых живут женщины и мужчины.',
    },
    'ip9a5w5i': {
      'ky': 'Home',
      'ru': 'Дом',
    },
  },
  // Miscellaneous
  {
    '0bsomfo7': {
      'ky': '',
      'ru': '',
    },
    'dsxbroem': {
      'ky': '',
      'ru': '',
    },
    'ep2oz8wr': {
      'ky': '',
      'ru': '',
    },
    'b6xtpafx': {
      'ky': '',
      'ru': '',
    },
    'bmdrusg9': {
      'ky': '',
      'ru': '',
    },
    'ohs4zuii': {
      'ky': '',
      'ru': '',
    },
    'g6p9i0s8': {
      'ky': '',
      'ru': '',
    },
    'gkblaccc': {
      'ky': '',
      'ru': '',
    },
    'en84eq3w': {
      'ky': '',
      'ru': '',
    },
    'xgb78dro': {
      'ky': '',
      'ru': '',
    },
    'mndol0gy': {
      'ky': '',
      'ru': '',
    },
    'm257igwc': {
      'ky': '',
      'ru': '',
    },
    'zn9ek9n2': {
      'ky': '',
      'ru': '',
    },
    'js3tnw7e': {
      'ky': '',
      'ru': '',
    },
    'dl8c1lkz': {
      'ky': '',
      'ru': '',
    },
    'td0p0qmx': {
      'ky': '',
      'ru': '',
    },
    'nyqtjjl8': {
      'ky': '',
      'ru': '',
    },
    'ko4y3j3o': {
      'ky': '',
      'ru': '',
    },
    'q6alvbep': {
      'ky': '',
      'ru': '',
    },
    'kg7wbp84': {
      'ky': '',
      'ru': '',
    },
    'w2nt7hbq': {
      'ky': '',
      'ru': '',
    },
    'm94kl6cl': {
      'ky': '',
      'ru': '',
    },
    'mb6xs8xt': {
      'ky': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
