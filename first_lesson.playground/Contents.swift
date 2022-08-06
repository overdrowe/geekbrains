import UIKit

// Здание #1
print("Задание #1");

quadraticEquation(a: 1, b:1, c:-2);

// Квадратное уравнение
func quadraticEquation(a: Double, b: Double, c: Double) {
    print("\(a)*x^2 + \(b)x + \(c) = 0");

    let bSquared = b * b;
    let discriminant = bSquared - (4 * a * c);
    let isImaginary = discriminant < 0;
    let discrimimantAbsSqrt = sqrt(fabs(discriminant));

    if isImaginary {
        print("X = (\(-b) + \(discrimimantAbsSqrt)i)/\(2*a) & (\(-b) - \(discrimimantAbsSqrt)i)/\(2*a)");
    } else {
        let topFormula = -b + discrimimantAbsSqrt;
        let bottomFormula = 2 * a;
        let totalX = topFormula / bottomFormula;

        let topFormula2 = -b - discrimimantAbsSqrt;
        let totalX2 = topFormula2 / bottomFormula;

        print("X = \(totalX) & \(totalX2)");
    }
}

// Задание #2
print("\nЗадание #2");

let triangle = RightTriangle(a: 3, b: 4);
print("Hypotenuse = \(triangle.c)");
print("S = \(triangle.getArea())");
print("P = \(triangle.getPerimetr())");

// Прямоугольный треугольник
class RightTriangle {
    
    init(a: Double, b: Double) {
        self.a = a;
        self.b = b;
        self.c = sqrt(pow(a,2) + pow(b,2));
    }
    
    var a : Double; // Катет
    var b : Double; // Тоже катет
    var c : Double; // Не катет (Гипотенуза)
    
    func getArea() -> Double {
        return a * b / 2;
    }
    
    func getPerimetr() -> Double {
        return a + b + c;
    }
}
