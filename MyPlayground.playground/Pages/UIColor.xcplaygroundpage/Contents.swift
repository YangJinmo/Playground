//: [Previous](@previous)

import UIKit

let black = UIColor(r: 0xAB, g: 0x47, b: 0xBC, a: 0.5)
let purple = UIColor.hex(0xAB47BC)
let purpleA = UIColor.hexa(0xAB47BCAB)
let white = UIColor(rgb: 0xFFFFFF, a: 0.5)

// MARK: - Extension UIColor

extension UIColor {
    convenience init(r: UInt32, g: UInt32, b: UInt32, a: CGFloat = 1.0) {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")

        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: a
        )
    }

    convenience init(rgb: UInt32, a: CGFloat = 1.0) {
        self.init(
            r: (rgb >> 16) & 0xFF,
            g: (rgb >> 8) & 0xFF,
            b: rgb & 0xFF,
            a: a
        )
    }

    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        return .init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }

    static func hex(_ hex: UInt32, a: CGFloat = 1.0) -> UIColor {
        let color = (
            r: (hex >> 16) & 0xFF,
            g: (hex >> 08) & 0xFF,
            b: (hex >> 00) & 0xFF
        )

        print("r: \(color.r), g: \(color.g), b: \(color.b), a: \(a)")

        return rgb(r: CGFloat(color.r), g: CGFloat(color.g), b: CGFloat(color.b), a: a)
    }

    static func hexa(_ hexa: UInt32) -> UIColor {
        let color = (
            r: (hexa >> 24) & 0xFF,
            g: (hexa >> 16) & 0xFF,
            b: (hexa >> 08) & 0xFF,
            a: CGFloat((hexa >> 00) & 0xFF) / 255
        )

        print("r: \(color.r), g: \(color.g), b: \(color.b), a: \(color.a)")

        return rgb(r: CGFloat(color.r), g: CGFloat(color.g), b: CGFloat(color.b), a: color.a)
    }
}

//: [Next](@next)
