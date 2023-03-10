//: [Previous](@previous)

import Foundation

1235.abbreviatedNumber

// MARK: - Extension Double

extension Double {
    func floorNumber(numberOfPlaces: Double = 2.0) -> Double {
        let multiplier = pow(10.0, numberOfPlaces)
        let floored = floor(self * multiplier) / multiplier
        return floored
    }
}

// MARK: - Extension Int

extension Int {
    /// returns number of digits in Int number
    public var digitCount: Int {
        return numberOfDigits(in: self)
    }

    /// returns number of useful digits in Int number
    public var usefulDigitCount: Int {
        var count = 0
        for digitOrder in 0 ..< digitCount {
            /// get each order digit from self
            let digit = self % Int(truncating: pow(10, digitOrder + 1) as NSDecimalNumber)
                / Int(truncating: pow(10, digitOrder) as NSDecimalNumber)
            if isUseful(digit) { count += 1 }
        }
        return count
    }

    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if number < 10 && number >= 0 || number > -10 && number < 0 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number / 10)
        }
    }

    // returns true if digit is useful in respect to self
    private func isUseful(_ digit: Int) -> Bool {
        return (digit != 0) && (self % digit == 0)
    }

    var abbreviatedNumber: String {
        print(digitCount)
        print(usefulDigitCount)

        if self >= 1000000 {
            return "\((Double(self) / 1000000).floorNumber())M"
        }
        if self >= 1000 {
            return "\((Double(self) / 1000).floorNumber())K"
        }
        return String(self)
    }
}

//: [Next](@next)
