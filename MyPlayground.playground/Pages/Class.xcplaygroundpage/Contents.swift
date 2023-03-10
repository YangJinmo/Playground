import UIKit

class Person {
    let name: String

    init(name: String) {
        self.name = name
    }

    var room: Room?

    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String

    init(number: String) {
        self.number = number
    }

    weak var host: Person?

    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var gaegul: Person? = Person(name: "Gaegul") // Person 1
var suite: Room? = Room(number: "101") // Room 1

gaegul?.room = suite // Room 2
suite?.host = gaegul // weak

gaegul = nil // Person 0
// Gaegul is being deinitialized
// gaegul 인스턴스 참조 횟수가 0이 되면서 인스턴스 내 room 프로퍼티도 -1됨 Room 1
suite = nil // Room 0
// Room 101 is being deinitialized

/// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7

incrementByTen()
// returns a value of 40

class People {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: People?
var reference2: People?
var reference3: People?

reference1 = People(name: "John Appleseed")
// Prints "John Appleseed is being initialized"

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil
// Prints "John Appleseed is being deinitialized"
