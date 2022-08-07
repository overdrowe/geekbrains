import UIKit

enum SpeedBoost : Int {
    case lite = 10;
    case medium = 30;
    case hight = 50;
    case ultima = 100;
}

class Car {
    init(brand: String, model: String, generation: Date, trunkCapacity: Double) {
        self.brand = brand;
        self.model = model;
        self.generation = generation;
        self.trunkCapacity = trunkCapacity;
    }
    
    let brand : String;
    let model : String;
    let generation : Date;
    let trunkCapacity : Double;
    
    
    var currentTrunkCapacity : Double = 0;
    var isTrunkFull : Bool {
        get {
            return currentTrunkCapacity >= trunkCapacity;
        }
    }
    
    func tryToAddToTheTrunk(value : Double) {
        if (currentTrunkCapacity + value <= trunkCapacity) {
            currentTrunkCapacity += value;
        }
    }
    
    // Управление окнами
    var isWindowsOpened : Bool = false;
    
    func toogleWindow() {
        isWindowsOpened = !isWindowsOpened;
    }
    
    //  управление двигателем авто
    var isEngineActivate : Bool = false;
    
    func toogleEngine() {
        isEngineActivate = !isEngineActivate;
        
        if (isEngineActivate) {
            currentSpeed = 60;
        } else {
            currentSpeed = 0;
        }
    }
    
    var currentSpeed : Int = 0;
    
    func increaseSpeed() {}
    
}

class SportCar : Car {
    
    func activeteSpeedBoosts(boostsList : Array<SpeedBoost>) {
        if (!isEngineActivate) {
            return;
        }
        
        for boostItem in boostsList {
            currentSpeed += boostItem.rawValue;
        }
    }
    
    override func increaseSpeed() {
        currentSpeed += 50;
    }
}

class TrunkCar : Car {
    func loadLuggage(valuesList : Array<Double>) {
        for value in valuesList {
            if (currentTrunkCapacity + value <= trunkCapacity) {
                currentTrunkCapacity += value;
            }
        }
    }
    
    override func increaseSpeed() {
        currentSpeed += 10;
    }
}

var cars : Array<Car> = [
    SportCar(
        brand: "Lada",
        model: "2106",
        generation: Date(timeIntervalSinceReferenceDate: -123456789.0),
        trunkCapacity: 20 // Мешков картошки
    ),
    TrunkCar(
        brand: "Kamaz",
        model: "s63",
        generation: Date(timeIntervalSinceReferenceDate: -80000000.0),
        trunkCapacity: 8
    )
]

for car in cars {
    car.currentSpeed;
    car.toogleEngine();
    
    if (car is SportCar) {
        (car as! SportCar).activeteSpeedBoosts(boostsList: [SpeedBoost.lite, SpeedBoost.medium]);
    }
    
    car.currentSpeed;
    
    car.currentTrunkCapacity;
    if (car is TrunkCar) {
        (car as! TrunkCar).loadLuggage(valuesList: [1,2,5,3]); // Последний груз не влезет
        (car as! TrunkCar).currentTrunkCapacity;
    }
    
    print("brand: \t\t\t\t\t\t\(car.brand)");
    print("model: \t\t\t\t\t\t\(car.model)");
    print("generation: \t\t\t\t\(car.generation)");
    print("currentSpeed: \t\t\t\t\(car.currentSpeed)");
    print("currentTrunkCapacity: \t\t\(car.currentTrunkCapacity)");
    print("trunkCapacity: \t\t\t\t\(car.trunkCapacity)");
    print("isTrunkFull: \t\t\t\t\(car.isTrunkFull)");
    print("isWindowsOpened: \t\t\t\(car.isWindowsOpened)");
    print("\n");
}
