import UIKit

enum SpeedBoost : Int {
    case lite = 10;
    case medium = 30;
    case hight = 50;
    case ultima = 100;
}

struct SportCar {
    let brand : String;
    let model : String;
    let generation : Date;
    let trunkCapacity : Double;
    
    var currentSpeed : Int = 0;
    
    //  управление двигателем авто
    var isEngineActivate : Bool = false;
    
    mutating func toogleEngine() {
        isEngineActivate = !isEngineActivate;
        
        if (isEngineActivate) {
            currentSpeed = 60;
        } else {
            currentSpeed = 0;
        }
    }
    
    
    // Управление окнами
    var isWindowsOpened : Bool = false;
    
    mutating func toogleWindow() {
        isWindowsOpened = !isWindowsOpened;
    }
    
    
    var currentTrunkCapacity : Double = 0;
    var isTrunkFull : Bool {
        get {
            return currentTrunkCapacity >= trunkCapacity;
        }
    }
    
    mutating func tryToAddToTheTrunk(value : Double) {
        if (currentTrunkCapacity + value <= trunkCapacity) {
            currentTrunkCapacity += value;
        }
    }
    
    mutating func activeteSpeedBoosts(boostsList : Array<SpeedBoost>) {
        if (!isEngineActivate) {
            return;
        }
        
        for boostItem in boostsList {
            currentSpeed += boostItem.rawValue;
        }
    }
}

struct TrunkCar {
    let brand : String;
    let model : String;
    let generation : Date;
    let trunkCapacity : Double;
    
    //  управление двигателем авто
    var isEngineActivate : Bool = false;
    
    mutating func toogleEngine() {
        isEngineActivate = !isEngineActivate;
    }
    
    
    // Управление окнами
    var isWindowsOpened : Bool = false;
    
    mutating func toogleWindow() {
        isWindowsOpened = !isWindowsOpened;
    }
    
    
    var currentTrunkCapacity : Double = 0;
    var isTrunkFull : Bool {
        get {
            return currentTrunkCapacity >= trunkCapacity;
        }
    }
    
    mutating func tryToAddToTheTrunk(value : Double) {
        if (currentTrunkCapacity + value <= trunkCapacity) {
            currentTrunkCapacity += value;
        }
    }
    
    mutating func loadLuggage(valuesList : Array<Double>) {
        for value in valuesList {
            if (currentTrunkCapacity + value <= trunkCapacity) {
                currentTrunkCapacity += value;
            }
        }
    }
}

var zhiguly = SportCar(
    brand: "Lada",
    model: "2106",
    generation: Date(timeIntervalSinceReferenceDate: -123456789.0),
    trunkCapacity: 20 // Мешков картошки
)

zhiguly.currentSpeed;
zhiguly.toogleEngine();
zhiguly.activeteSpeedBoosts(boostsList: [SpeedBoost.lite, SpeedBoost.medium]);
zhiguly.currentSpeed;

print("zhiguly.brand: \(zhiguly.brand)");
print("zhiguly.model: \(zhiguly.model)");
print("zhiguly.generation: \(zhiguly.generation)");
print("zhiguly.currentSpeed: \(zhiguly.currentSpeed)");
print("zhiguly.currentTrunkCapacity: \(zhiguly.currentTrunkCapacity)");
print("zhiguly.trunkCapacity: \(zhiguly.trunkCapacity)");
print("zhiguly.isTrunkFull: \(zhiguly.isTrunkFull)");
print("zhiguly.isWindowsOpened: \(zhiguly.isWindowsOpened)");

print("\n");

var kamaz = TrunkCar(
    brand: "Kamaz",
    model: "s63",
    generation: Date(timeIntervalSinceReferenceDate: -80000000.0),
    trunkCapacity: 8
)

kamaz.currentTrunkCapacity;
kamaz.loadLuggage(valuesList: [1,2,5,3]); // Последний груз не влезет
kamaz.currentTrunkCapacity;

print("kamaz.brand: \(kamaz.brand)");
print("kamaz.model: \(kamaz.model)");
print("kamaz.generation: \(kamaz.generation)");
print("kamaz.currentTrunkCapacity: \(kamaz.currentTrunkCapacity)");
print("kamaz.trunkCapacity: \(kamaz.trunkCapacity)");
print("kamaz.isTrunkFull: \(kamaz.isTrunkFull)");
print("kamaz.isWindowsOpened: \(kamaz.isWindowsOpened)");
