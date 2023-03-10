//: [Previous](@previous)

import Foundation

var str1: String?
var str2: String? = ""
var str3: String? = "zzimss"
var str4: String? = "monkey"

var strArr: [String?] = [str1, str2, str3, str4]

let url1 = URL(string: str1 ?? "")
let url2 = URL(string: str2 ?? "")
let url3 = URL(string: str3 ?? "")

let urlF1: URL? = str1.flatMap { URL(string: $0) }
let urlF2: URL? = str2.flatMap { URL(string: $0) }
let urlF3: URL? = str3.flatMap { URL(string: $0) }

print("urlF1:", urlF1 ?? "default")
print("urlF2:", urlF2 ?? "default")
print("urlF3:", urlF3 ?? "default")

// let urlFlatMap = strArr.flatMap { URL(string: $0 ?? "") } // deprecated
let urlOptionalMap: [URL?] = strArr.map { URL(string: $0 ?? "") }
let urlOptionalCompactMap: [URL?] = strArr.compactMap { URL(string: $0 ?? "") }
let urlCompactMap: [URL] = strArr.compactMap { URL(string: $0 ?? "") }

print("urlOptionalMap:", urlOptionalMap) // Optional
print("urlOptionalCompactMap:", urlOptionalCompactMap) // Optional
print("urlCompactMap:", urlCompactMap) // Non-Optional

let str5 = "Hello, Swift"
str5.range(of: "Swift")
str5.range(of: "swift", options: [.caseInsensitive]) // 대소문자 무시 옵션
let str6 = "Hello, Programming"
let str7 = str6.lowercased()

var common = str5.commonPrefix(with: str6) // 공통된 문자열만 뽑기

var sentence = " A barking dog never bites, A big fish in a small pond, No pain No gain, A good medicine tastes bitter, It never rains but it pours, A bad workman blames his tools, A barking dog never bites, A big fish in a small pond, No pain No gain, A good medicine tastes bitter, It never rains but it pours, A bad workman blames his tools, A barking dog never bites, A big fish in a small pond, No pain No gain, A good medicine tastes bitter, It never rains but it pours, A bad workman blames his tools, A barking dog never bites, A big fish in a small pond, No pain No gain, A good medicine tastes bitter, It never rains but it pours, A bad workman blames his tools, A barking dog never bites, A big fish in a small pond, No pain No gain, A good medicine tastes bitter, It never rains but it pours, A bad workman blames his tools.\n\n#bad #workman #blames #bad #workman #blames"

var sharp = 0

if let rangeSharp = sentence.range(of: "#") {
    sharp = sentence.distance(from: sentence.startIndex, to: rangeSharp.lowerBound)
}

let testString = "He thrusts his fists against the posts and still insists he sees the ghosts."
print(testString.truncate(to: 20, addEllipsis: true))

// Prints: 7

// Prints: He thrusts his fists...

extension String {
    func rangeByIndex(start: Int, end: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: start)
        let endIndex = index(self.startIndex, offsetBy: end)
        let c = self[startIndex ... endIndex]
        return String(c)
    }

    /**
     ```
     let testString = "He thrusts his fists against the posts and still insists he sees the ghosts."
     print(testString.truncate(to: 20, addEllipsis: true))
     // Prints: He thrusts his fists...
     ```
     */

    func truncate(to length: Int, addEllipsis: Bool = false) -> String {
        if length > count { return self }

        let endPosition = index(startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]

        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }

    // 특정 범위의 문자는 문자열[범위]로 가능하다.

    // 첫번째 문자.
    var start: String {
        let c: Character = self[startIndex]
        return String(c)
    }

    // 마지막 문자.
    var end: String {
        let endIndex: Index = index(before: self.endIndex)
        let c: Character = self[endIndex]
        return String(c)
    }

    // 특정 문자의 위치 없는경우 nil 반환 여러개면 맨 처음 검색되는 문자열만 반환.
    func indexLocation(char: String) -> Int? {
        if let charRange: Range<String.Index> = range(of: char) {
            let location: Int = distance(from: startIndex, to: charRange.lowerBound)
            return location
        }
        return nil
    }

    // 현재 문자열에서 찾는 문자까지의 범위. 찾는 문자가 없으면 nil
    func rangeOfString(char: String) -> ClosedRange<String.Index>? {
        let startIndex = self.startIndex
        guard let findIndex = indexLocation(char: char) else {
            return nil
        }
        let endIndex = index(startIndex, offsetBy: findIndex)
        let resultRange = startIndex ... endIndex
        return resultRange
    }

    // 현재 문자열에서 찾는 문자 전까지의 범위. 찾는 문자가 없으면 nil
    func preRangeOfString(char: String) -> ClosedRange<String.Index>? {
        let startIndex = self.startIndex
        guard let findIndex = indexLocation(char: char) else {
            return nil
        }
        let endIndex = index(startIndex, offsetBy: findIndex - 1)
        let resultRange = startIndex ... endIndex
        return resultRange
    }

    // 현재 문자열에서 찾는 문자 전까지의 범위. 찾는 문자가 없으면 nil
    func postRangeOfString(char: String) -> ClosedRange<String.Index>? {
        guard let findIndex = indexLocation(char: char) else {
            return nil
        }
        let startIndex = index(self.startIndex, offsetBy: findIndex + 1)
        let endIndex = index(before: self.endIndex)
        let resultRange = startIndex ... endIndex
        return resultRange
    }

    // a문자부터 b문자까지의 범위
    func rangeOfString(aChar: String, bChar: String) -> ClosedRange<String.Index>? {
        guard let findA = indexLocation(char: aChar) else {
            return nil
        }
        let startIndex = index(self.startIndex, offsetBy: findA)

        guard let findB = indexLocation(char: bChar) else {
            return nil
        }
        let endIndex = index(self.startIndex, offsetBy: findB)
        let resultRange = startIndex ... endIndex
        return resultRange
    }

    // 특정 위치의 문자
    func rangeOfDistance(a: Int, b: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: a)
        let endIndex = index(self.startIndex, offsetBy: b)
        let c = self[startIndex ... endIndex]
        return String(c)
    }

    // 특정 문자의 위치를 갖고있는 배열을 반환

    // self에서 특정 문자의 범위를 찾는다
    // 특정 문자의 범위로 특정 문자를 찾는다.
    func indexLocations(char: String) -> [Int] {
        let strArr = Array(self)
        let result = strArr.enumerated().filter { (arg: (offset: Int, element: String.Element)) -> Bool in
            String(arg.element) == char
        }.compactMap { (index: Int, _: String.Element) -> Int in
            index
        }
        return result
    }
}

//: [Next](@next)
