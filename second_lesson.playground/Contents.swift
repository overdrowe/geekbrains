import UIKit

// Домашнее задание #2

let x : Int = 12 ;

// #1
x.isEven(); // Четное ли число

// #2
x.isMultipleOfThree(); // Кратно ли число трем

// #3
var arr = Array(1...100); // Массив из 100 чисел
arr.count;

// #4
// Удаление всех четных чисел и чисел не делимых на 3 из массива
arr.removeAll { value in
    return value.isEven() || !value.isMultipleOfThree();
}

arr;
arr.count;

extension Int {
    // #1
    func isEven() -> Bool {
        return self % 2 == 0
            ? true
            : false;
    }

    // #2
    func isMultipleOfThree() -> Bool {
        return isMultiple(of: 3);
    }
}
