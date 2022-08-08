import UIKit

enum SpeedBoost : Int {
    case lite = 10;
    case medium = 30;
    case hight = 50;
    case ultima = 100;
}

protocol Car {
    var brand : String { get };
    var model : String { get };
    var generation : Date { get };
    var trunkCapacity : Double { get };
    
    var currentTrunkCapacity : Double { get set };
    var isTrunkFull : Bool { get }
    func tryToAddToTheTrunk(value : Double);
    
    // Управление окнами
    var isWindowsOpened : Bool { get };
    func toogleWindow();
    
    //  управление двигателем авто
    var isEngineActivate : Bool { get };
    func toogleEngine();
    
    // управление скоростью
    var currentSpeed : Int { get };
    func increaseSpeed();
}

class SportCar : Car {
    init(brand: String, model: String, generation: Date, trunkCapacity: Double, clearance: Double) {
        self.brand = brand;
        self.model = model;
        self.generation = generation;
        self.trunkCapacity = trunkCapacity;
        self.clearance = clearance;
    }
    
    let brand: String
    let model: String
    let generation: Date
    let trunkCapacity: Double
    
    let clearance : Double;
    
    var currentTrunkCapacity: Double = 0;
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
    
    var isWindowsOpened: Bool = false;
    func toogleWindow() {
        isWindowsOpened = !isWindowsOpened;
    }
    
    var isEngineActivate: Bool = false;
    func toogleEngine() {
        isEngineActivate = !isEngineActivate;
        
        if (isEngineActivate) {
            currentSpeed = 60;
        } else {
            currentSpeed = 0;
        }
    }
    
    var currentSpeed: Int = 0;
    
    func activeteSpeedBoosts(boostsList : Array<SpeedBoost>) {
        if (!isEngineActivate) {
            return;
        }
        
        for boostItem in boostsList {
            currentSpeed += boostItem.rawValue;
        }
    }
    
    func increaseSpeed() {
        currentSpeed += 50;
    }
}

class TrunkCar : Car {
    init(brand: String, model: String, generation: Date, trunkCapacity: Double, loadCapacity: Double) {
        self.brand = brand;
        self.model = model;
        self.generation = generation;
        self.trunkCapacity = trunkCapacity;
        self.loadCapacity = loadCapacity;
    }
    
    let brand: String
    let model: String
    let generation: Date
    let trunkCapacity: Double
    
    let loadCapacity : Double;
    
    var currentTrunkCapacity: Double = 0;
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
    
    var isWindowsOpened: Bool = false;
    func toogleWindow() {
        isWindowsOpened = !isWindowsOpened;
    }
    
    var isEngineActivate: Bool = false;
    func toogleEngine() {
        isEngineActivate = !isEngineActivate;
        
        if (isEngineActivate) {
            currentSpeed = 60;
        } else {
            currentSpeed = 0;
        }
    }
    
    var currentSpeed: Int = 0;
    
    func loadLuggage(valuesList : Array<Double>) {
        for value in valuesList {
            if (currentTrunkCapacity + value <= trunkCapacity) {
                currentTrunkCapacity += value;
            }
        }
    }
    
    func increaseSpeed() {
        currentSpeed += 10;
    }
}

// Расширения

extension SportCar : CustomStringConvertible {
    var description: String {
        return "Это спорткар с клиренсом в \(clearance) сантиметров";
    }
}

extension TrunkCar : CustomStringConvertible {
    var description: String {
        return "Это грузовик с грузоподъемностью в \(loadCapacity) тонн";
    }
}

// Использование

var cars : Array<Car> = [
    SportCar(
        brand: "Lada",
        model: "2101",
        generation: Date(timeIntervalSinceReferenceDate: -100000000.0),
        trunkCapacity: 18, // Мешков картошки
        clearance: 10
    ),
    SportCar(
        brand: "Lada",
        model: "2106",
        generation: Date(timeIntervalSinceReferenceDate: -123456789.0),
        trunkCapacity: 20, // Мешков картошки
        clearance: 5
    ),
    TrunkCar(
        brand: "Belaz",
        model: "2",
        generation: Date(timeIntervalSinceReferenceDate: -20000000.0),
        trunkCapacity: 20,
        loadCapacity: 100
    ),
    TrunkCar(
        brand: "Kamaz",
        model: "s63",
        generation: Date(timeIntervalSinceReferenceDate: -80000000.0),
        trunkCapacity: 8,
        loadCapacity: 30
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
    if (car is SportCar)
    {
        print("description: \t\t\t\t\((car as! SportCar).description)");
    }
    if (car is TrunkCar)
    {
        print("description: \t\t\t\t\((car as! TrunkCar).description)");
    }
    print("\n");
}
