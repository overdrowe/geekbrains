import UIKit

greet(person: "Anton");


func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
