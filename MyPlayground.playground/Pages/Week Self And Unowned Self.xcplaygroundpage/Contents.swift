//: [Previous](@previous)

import UIKit

class Test {
    var number = Int()

    // strong self
    /*
     lazy var test: () -> (Int) = {
       self.number += 1
       return self.number
     }
      */

    // weak self
    lazy var test: () -> (Int) = { [weak self] in
        if var number = self?.number {
            number += 1
            return number
        } else {
            return Int()
        }
    }

    // unowned self
    /*
     lazy var test: () -> (Int) = { [unowned self] in
       self.number += 1
       return self.number
     }
      */

    init(number: Int) {
        self.number = number
    }

    deinit {
        print("Test is done.")
    }
}

var test: Test? = Test(number: 10)
print(test!.test()) // 11
test = nil // strong self의 경우 메모리에서 Test가 deallocate 되지 않는다.

let a = test!.test
test = nil // Test is done.
a() // unowned self의 경우 crash!!!

//: [Next](@next)
