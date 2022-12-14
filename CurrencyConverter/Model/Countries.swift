//
//  Countries.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 04.10.2022.
//

import Foundation

class Countries {
    
    let allCountries = [
    
    "USD": "Доллар США",
    "AED": "Дихрам ОАЭ",
    "AFN": "Афгани",
    "ALL": "Лек",
    "AMD": "Драм (армянский драм)",
    "ANG": "Гульден (нидерландский гульден)",
    "AOA": "Кванза",
    "ARS": "Песо (аргентинское песо)",
    "AUD": "Доллар (австралийский доллар)",
    "AWG": "Флорин (арубанский флорин)",
    "AZN": "Манат (азербайджанский манат)",
    "BAM": "Марка (конвертируемая марка)",
    "BBD": "Доллар (барбадосский доллар)",
    "BDT": "Така",
    "BGN": "Лев (болгарский лев)",
    "BHD": "Динар (бахрейнский динар)",
    "BIF": "Франк (бурундийский франк)",
    "BMD": "Доллар (бермудский доллар)",
    "BND": "Доллар (брунейский доллар)",
    "BOB": "Боливиано",
    "BRL": "Реал (бразильский реал)",
    "BSD": "Доллар (багамский доллар)",
    "BTC": "Биткойн",
    "BTN": "Нгултрум[",
    "BWP": "Пула",
    "BYN": "Рубль (белорусский рубль)",
    "BZD": "Доллар (белизский доллар)",
    "CAD": "Доллар (канадский доллар)",
    "CDF": "Франк (конголезский франк)",
    "CHF": "Франк (швейцарский франк)",
    "CLF": "Чили",
    "CLP": "Песо (чилийское песо)",
    "CNH": "Китайский юань",
    "CNY": "Юань",
    "COP": "Песо (колумбийское песо)",
    "CRC": "Колон (коста-риканский колон)",
    "CUC": "Кубинское песо",
    "CUP": "Песо (кубинское песо)",
    "CVE": "Эскудо (эскудо Кабо-Верде)",
    "CZK": "Крона (чешская крона)",
    "DJF": "Франк (франк Джибути)",
    "DKK": "Крона (датская крона)",
    "DOP": "Песо (доминиканское песо)",
    "DZD": "Динар (алжирский динар)",
    "EGP": "Фунт (египетский фунт)",
    "ERN": "Накфа",
    "ETB": "Быр (эфиопский быр)",
    "EUR": "Евро",
    "FJD": "Доллар (доллар Фиджи)",
    "FKP": "Фунт (фунт Фолклендских островов)",
    "GBP": "Фунт (фунт стерлингов)",
    "GEL": "Лари",
    "GGP": "Фунт (гернсийский)",
    "GHS": "Седи (ганский седи)",
    "GIP": "Фунт (гибралтарский фунт)",
    "GMD": "Даласи",
    "GNF": "Франк (гвинейский франк)",
    "GTQ": "Кетсаль",
    "GYD": "Доллар (гайанский доллар)",
    "HKD": "Доллар (гонконгский доллар)",
    "HNL": "Лемпира",
    "HRK": "Куна (хорватская куна)",
    "HTG": "Гурд",
    "HUF": "Форинт",
    "IDR": "Рупия (индонезийская рупия)",
    "ILS": "Шекель (новый израильский шекель)",
    "IMP": "Фунт (Острова Мэн)",
    "INR": "Нгултрум",
    "IQD": "Динар (иракский динар)",
    "IRR": "Риал (иранский риал)",
    "ISK": "Крона (исландская крона)",
    "JEP": "Фунт (джерсийский)",
    "JMD": "Доллар (ямайский доллар)",
    "JOD": "Динар (иорданский динар)",
    "JPY": "Иена",
    "KES": "Шиллинг (кенийский шиллинг)",
    "KGS": "Сом",
    "KHR": "Риель",
    "KMF": "Франк (франк Комор)",
    "KPW": "Вона (северокорейская вона)",
    "KRW": "Вона (южнокорейская вона)",
    "KWD": "Динар (кувейтский динар)",
    "KYD": "Доллар (доллар Островов Кайман)",
    "KZT": "Тенге",
    "LAK": "Кип",
    "LBP": "Фунт (ливанский фунт)",
    "LKR": "Рупия (шри-ланкийская рупия)",
    "LRD": "Доллар (либерийский доллар)",
    "LSL": "Лоти (мн. Малоти)",
    "LYD": "Динар (ливийский динар)",
    "MAD": "Дирхам (марокканский дирхам)",
    "MDL": "Лей (молдавский лей)",
    "MGA": "Ариари (малагасийский ариари)",
    "MKD": "Денар",
    "MMK": "Кьят",
    "MNT": "Тугрик",
    "MOP": "Патака",
    "MRU": "Угия",
    "MUR": "Рупия (маврикийская рупия)",
    "MVR": "Руфия",
    "MWK": "Квача",
    "MXN": "Песо (мексиканское песо)",
    "MYR": "Ринггит (малайзийский ринггит)",
    "MZN": "Метикал (мозамбикский метикал)",
    "NAD": "Доллар (доллар Намибии)",
    "NGN": "Найра",
    "NIO": "Кордоба (золотая кордоба)",
    "NOK": "Крона (норвежская крона)",
    "NPR": "Рупия (непальская рупия)",
    "NZD": "Доллар (новозеландский доллар)",
    "OMR": "Риал (оманский риал)",
    "PAB": "Бальбоа",
    "PEN": "Соль (новый соль)",
    "PGK": "Кина",
    "PHP": "Песо (филиппинское песо)",
    "PKR": "Рупия (пакистанская рупия)",
    "PLN": "Злотый",
    "PYG": "Гуарани",
    "QAR": "Риал (катарский риал)",
    "RON": "Лей (румынский лей)",
    "RSD": "Динар (сербский динар)",
    "RUB": "Рубль (российский рубль)",
    "RWF": "Франк (франк Руанды)",
    "SAR": "Риял (саудовский риял)",
    "SBD": "Доллар (доллар Соломоновых Островов)",
    "SCR": "Рупия (сейшельская рупия)",
    "SDG": "Фунт (суданский фунт)",
    "SEK": "Крона (шведская крона)",
    "SGD": "Доллар (брунейский доллар)",
    "SHP": "Фунт (фунт Святой Елены)",
    "SLL": "Леоне",
    "SOS": "Шиллинг (сомалийский шиллинг)",
    "SRD": "Доллар (суринамский доллар)",
    "SSP": "Фунт (южносуданский фунт)",
    "STD": "Добра",
    "STN": "Добра",
    "SVC": "Колон (сальвадорский колон)",
    "SYP": "Фунт (сирийский фунт)",
    "SZL": "Лилангени (мн. Эмалангени)",
    "THB": "Бат",
    "TJS": "Сомони",
    "TMT": "Манат (новый туркменский манат)",
    "TND": "Динар (тунисский динар)",
    "TOP": "Паанга",
    "TRY": "Лира (турецкая лира)",
    "TTD": "Доллар (доллар Тринидада и Тобаго)",
    "TWD": "Доллар (новый тайваньский доллар)",
    "TZS": "Шиллинг (танзанийский шиллинг)",
    "UAH": "Гривна",
    "UGX": "Шиллинг (угандийский шиллинг)",
    "UYU": "Песо (уругвайское песо)",
    "UZS": "Сум (узбекский сум)",
    "VES": "Суверенный боливар",
    "VND": "Донг",
    "VUV": "Вату",
    "WST": "Тала",
    "XAF": "Франк (франк КФА BEAC)",
    "XAG": "Серебро (тройская унция)",
    "XAU": "Золото (тройская унция)",
    "XCD": "Доллар (восточно-карибский доллар)",
    "XDR": "Кьят",
    "XOF": "Франк (франк КФА BCEAO)",
    "XPD": "Палладий (тройская унция)",
    "XPF": "Франк (франк КФП)",
    "XPT": "Платина (тройская унция)",
    "YER": "Риал (йеменский риал)",
    "ZAR": "Лоти (мн. Малоти)",
    "ZMW": "Квача (замбийская квача)",
    "ZWL": "Доллар (доллар Зимбабве)"
    ]
}
