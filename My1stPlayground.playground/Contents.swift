import UIKit

greet(a: 1, b:2, c:3);


func greet(a: Double, b: Double, c: Double) -> String {
    let bSquared = b * b
    let discriminant = bSquared - (4 * a * c)
    let isImaginary = discriminant < 0
    let discrimimantAbsSqrt = sqrt(fabs(discriminant))

    if isImaginary {
        print("X = (\(-b) + \(discrimimantAbsSqrt)i)/\(2*a) & (\(-b) - \(discrimimantAbsSqrt)i)/\(2*a)")
    } else {
        let topFormula = -b + discrimimantAbsSqrt
        let bottomFormula = 2 * a
        let totalX = topFormula / bottomFormula

        let topFormula2 = -b - discrimimantAbsSqrt
        let totalX2 = topFormula2 / bottomFormula

        print("X = \(totalX) & \(totalX2)")
    }
    
    return "";
}
