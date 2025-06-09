import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    var nickname: String
    var height: Int // in cm
    var armSpan: Int // in cm
    var weight: Int // in kg
    var boulderGrade: BoulderGrade
    var sportGrade: SportGrade
    var profileImageURL: String?
}

enum BoulderGrade: String, Codable, CaseIterable {
    case v0 = "V0"
    case v1 = "V1"
    case v2 = "V2"
    case v3 = "V3"
    case v4 = "V4"
    case v5 = "V5"
    case v6 = "V6"
    case v7 = "V7"
    case v8 = "V8"
    case v9 = "V9"
    case v10 = "V10"
    case v10Plus = "V10+"
}

enum SportGrade: String, Codable, CaseIterable {
    case fiveNine = "5.9"
    case fiveTenA = "5.10a"
    case fiveTenB = "5.10b"
    case fiveTenC = "5.10c"
    case fiveTenD = "5.10d"
    case fiveElevenA = "5.11a"
    case fiveElevenB = "5.11b"
    case fiveElevenC = "5.11c"
    case fiveElevenD = "5.11d"
    case fiveTwelveA = "5.12a"
    case fiveTwelveB = "5.12b"
    case fiveTwelveC = "5.12c"
    case fiveTwelveD = "5.12d"
    case fiveThirteenA = "5.13a"
    case fiveThirteenB = "5.13b"
    case fiveThirteenC = "5.13c"
    case fiveThirteenD = "5.13d"
    case fiveFourteenA = "5.14a"
    case fiveFourteenB = "5.14b"
    case fiveFourteenC = "5.14c"
    case fiveFourteenD = "5.14d"
    case fiveFourteenPlus = "5.14+"
} 