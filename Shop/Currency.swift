//
//  Currency.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

enum Currency : String {
    case AED = "AED"
    case AFN = "AFN"
    case ALL = "ALL"
    case AMD = "AMD"
    case ANG = "ANG"
    case AOA = "AOA"
    case ARS = "ARS"
    case AUD = "AUD"
    case AWG = "AWG"
    case AZN = "AZN"
    case BAM = "BAM"
    case BBD = "BBD"
    case BDT = "BDT"
    case BGN = "BGN"
    case BHD = "BHD"
    case BIF = "BIF"
    case BMD = "BMD"
    case BND = "BND"
    case BOB = "BOB"
    case BRL = "BRL"
    case BSD = "BSD"
    case BTC = "BTC"
    case BTN = "BTN"
    case BWP = "BWP"
    case BYR = "BYR"
    case BZD = "BZD"
    case CAD = "CAD"
    case CDF = "CDF"
    case CHF = "CHF"
    case CLF = "CLF"
    case CLP = "CLP"
    case CNY = "CNY"
    case COP = "COP"
    case CRC = "CRC"
    case CUC = "CUC"
    case CUP = "CUP"
    case CVE = "CVE"
    case CZK = "CZK"
    case DJF = "DJF"
    case DKK = "DKK"
    case DOP = "DOP"
    case DZD = "DZD"
    case EEK = "EEK"
    case EGP = "EGP"
    case ERN = "ERN"
    case ETB = "ETB"
    case EUR = "EUR"
    case FJD = "FJD"
    case FKP = "FKP"
    case GBP = "GBP"
    case GEL = "GEL"
    case GGP = "GGP"
    case GHS = "GHS"
    case GIP = "GIP"
    case GMD = "GMD"
    case GNF = "GNF"
    case GTQ = "GTQ"
    case GYD = "GYD"
    case HKD = "HKD"
    case HNL = "HNL"
    case HRK = "HRK"
    case HTG = "HTG"
    case HUF = "HUF"
    case IDR = "IDR"
    case ILS = "ILS"
    case IMP = "IMP"
    case INR = "INR"
    case IQD = "IQD"
    case IRR = "IRR"
    case ISK = "ISK"
    case JEP = "JEP"
    case JMD = "JMD"
    case JOD = "JOD"
    case JPY = "JPY"
    case KES = "KES"
    case KGS = "KGS"
    case KHR = "KHR"
    case KMF = "KMF"
    case KPW = "KPW"
    case KRW = "KRW"
    case KWD = "KWD"
    case KYD = "KYD"
    case KZT = "KZT"
    case LAK = "LAK"
    case LBP = "LBP"
    case LKR = "LKR"
    case LRD = "LRD"
    case LSL = "LSL"
    case LTL = "LTL"
    case LVL = "LVL"
    case LYD = "LYD"
    case MAD = "MAD"
    case MDL = "MDL"
    case MGA = "MGA"
    case MKD = "MKD"
    case MMK = "MMK"
    case MNT = "MNT"
    case MOP = "MOP"
    case MRO = "MRO"
    case MUR = "MUR"
    case MVR = "MVR"
    case MWK = "MWK"
    case MXN = "MXN"
    case MYR = "MYR"
    case MZN = "MZN"
    case NAD = "NAD"
    case NGN = "NGN"
    case NIO = "NIO"
    case NOK = "NOK"
    case NPR = "NPR"
    case NZD = "NZD"
    case OMR = "OMR"
    case PAB = "PAB"
    case PEN = "PEN"
    case PGK = "PGK"
    case PHP = "PHP"
    case PKR = "PKR"
    case PLN = "PLN"
    case PYG = "PYG"
    case QAR = "QAR"
    case RON = "RON"
    case RSD = "RSD"
    case RUB = "RUB"
    case RWF = "RWF"
    case SAR = "SAR"
    case SBD = "SBD"
    case SCR = "SCR"
    case SDG = "SDG"
    case SEK = "SEK"
    case SGD = "SGD"
    case SHP = "SHP"
    case SLL = "SLL"
    case SOS = "SOS"
    case SRD = "SRD"
    case STD = "STD"
    case SVC = "SVC"
    case SYP = "SYP"
    case SZL = "SZL"
    case THB = "THB"
    case TJS = "TJS"
    case TMT = "TMT"
    case TND = "TND"
    case TOP = "TOP"
    case TRY = "TRY"
    case TTD = "TTD"
    case TWD = "TWD"
    case TZS = "TZS"
    case UAH = "UAH"
    case UGX = "UGX"
    case USD = "USD"
    case UYU = "UYU"
    case UZS = "UZS"
    case VEF = "VEF"
    case VND = "VND"
    case VUV = "VUV"
    case WST = "WST"
    case XAF = "XAF"
    case XAG = "XAG"
    case XAU = "XAU"
    case XCD = "XCD"
    case XDR = "XDR"
    case XOF = "XOF"
    case XPF = "XPF"
    case YER = "YER"
    case ZAR = "ZAR"
    case ZMK = "ZMK"
    case ZMW = "ZMW"
    case ZWL = "ZWL"
    case Unknown = "unknown"
}

extension Currency {
    init(string: String) {
        switch string {
        case "AED": self = .AED
        case "AFN": self = .AFN
        case "ALL": self = .ALL
        case "AMD": self = .AMD
        case "ANG": self = .ANG
        case "AOA": self = .AOA
        case "ARS": self = .ARS
        case "AUD": self = .AUD
        case "AWG": self = .AWG
        case "AZN": self = .AZN
        case "BAM": self = .BAM
        case "BBD": self = .BBD
        case "BDT": self = .BDT
        case "BGN": self = .BGN
        case "BHD": self = .BHD
        case "BIF": self = .BIF
        case "BMD": self = .BMD
        case "BND": self = .BND
        case "BOB": self = .BOB
        case "BRL": self = .BRL
        case "BSD": self = .BSD
        case "BTC": self = .BTC
        case "BTN": self = .BTN
        case "BWP": self = .BWP
        case "BYR": self = .BYR
        case "BZD": self = .BZD
        case "CAD": self = .CAD
        case "CDF": self = .CDF
        case "CHF": self = .CHF
        case "CLF": self = .CLF
        case "CLP": self = .CLP
        case "CNY": self = .CNY
        case "COP": self = .COP
        case "CRC": self = .CRC
        case "CUC": self = .CUC
        case "CUP": self = .CUP
        case "CVE": self = .CVE
        case "CZK": self = .CZK
        case "DJF": self = .DJF
        case "DKK": self = .DKK
        case "DOP": self = .DOP
        case "DZD": self = .DZD
        case "EEK": self = .EEK
        case "EGP": self = .EGP
        case "ERN": self = .ERN
        case "ETB": self = .ETB
        case "EUR": self = .EUR
        case "FJD": self = .FJD
        case "FKP": self = .FKP
        case "GBP": self = .GBP
        case "GEL": self = .GEL
        case "GGP": self = .GGP
        case "GHS": self = .GHS
        case "GIP": self = .GIP
        case "GMD": self = .GMD
        case "GNF": self = .GNF
        case "GTQ": self = .GTQ
        case "GYD": self = .GYD
        case "HKD": self = .HKD
        case "HNL": self = .HNL
        case "HRK": self = .HRK
        case "HTG": self = .HTG
        case "HUF": self = .HUF
        case "IDR": self = .IDR
        case "ILS": self = .ILS
        case "IMP": self = .IMP
        case "INR": self = .INR
        case "IQD": self = .IQD
        case "IRR": self = .IRR
        case "ISK": self = .ISK
        case "JEP": self = .JEP
        case "JMD": self = .JMD
        case "JOD": self = .JOD
        case "JPY": self = .JPY
        case "KES": self = .KES
        case "KGS": self = .KGS
        case "KHR": self = .KHR
        case "KMF": self = .KMF
        case "KPW": self = .KPW
        case "KRW": self = .KRW
        case "KWD": self = .KWD
        case "KYD": self = .KYD
        case "KZT": self = .KZT
        case "LAK": self = .LAK
        case "LBP": self = .LBP
        case "LKR": self = .LKR
        case "LRD": self = .LRD
        case "LSL": self = .LSL
        case "LTL": self = .LTL
        case "LVL": self = .LVL
        case "LYD": self = .LYD
        case "MAD": self = .MAD
        case "MDL": self = .MDL
        case "MGA": self = .MGA
        case "MKD": self = .MKD
        case "MMK": self = .MMK
        case "MNT": self = .MNT
        case "MOP": self = .MOP
        case "MRO": self = .MRO
        case "MUR": self = .MUR
        case "MVR": self = .MVR
        case "MWK": self = .MWK
        case "MXN": self = .MXN
        case "MYR": self = .MYR
        case "MZN": self = .MZN
        case "NAD": self = .NAD
        case "NGN": self = .NGN
        case "NIO": self = .NIO
        case "NOK": self = .NOK
        case "NPR": self = .NPR
        case "NZD": self = .NZD
        case "OMR": self = .OMR
        case "PAB": self = .PAB
        case "PEN": self = .PEN
        case "PGK": self = .PGK
        case "PHP": self = .PHP
        case "PKR": self = .PKR
        case "PLN": self = .PLN
        case "PYG": self = .PYG
        case "QAR": self = .QAR
        case "RON": self = .RON
        case "RSD": self = .RSD
        case "RUB": self = .RUB
        case "RWF": self = .RWF
        case "SAR": self = .SAR
        case "SBD": self = .SBD
        case "SCR": self = .SCR
        case "SDG": self = .SDG
        case "SEK": self = .SEK
        case "SGD": self = .SGD
        case "SHP": self = .SHP
        case "SLL": self = .SLL
        case "SOS": self = .SOS
        case "SRD": self = .SRD
        case "STD": self = .STD
        case "SVC": self = .SVC
        case "SYP": self = .SYP
        case "SZL": self = .SZL
        case "THB": self = .THB
        case "TJS": self = .TJS
        case "TMT": self = .TMT
        case "TND": self = .TND
        case "TOP": self = .TOP
        case "TRY": self = .TRY
        case "TTD": self = .TTD
        case "TWD": self = .TWD
        case "TZS": self = .TZS
        case "UAH": self = .UAH
        case "UGX": self = .UGX
        case "USD": self = .USD
        case "UYU": self = .UYU
        case "UZS": self = .UZS
        case "VEF": self = .VEF
        case "VND": self = .VND
        case "VUV": self = .VUV
        case "WST": self = .WST
        case "XAF": self = .XAF
        case "XAG": self = .XAG
        case "XAU": self = .XAU
        case "XCD": self = .XCD
        case "XDR": self = .XDR
        case "XOF": self = .XOF
        case "XPF": self = .XPF
        case "YER": self = .YER
        case "ZAR": self = .ZAR
        case "ZMK": self = .ZMK
        case "ZMW": self = .ZMW
        case "ZWL": self = .ZWL
        default: self = .Unknown
        }
    }
}
