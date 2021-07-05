import UIKit
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

struct SportCar {
    let brand: String
    let releaseDate: Int
    let maxLoad: Int
    var filledLoad: Int {
        willSet {
            if newValue == 0{
                    print("Сейчас выбросим из машины все барахло")
            } else {
                print("Начинается погрузка багажа в автомобиль")
            }
        }
    }
    var engineState: EngineState
    var windowsState: WindowsState
    let maxSpeed: Int
    
    mutating func openWindows() {
        self.windowsState = .open
    }
    mutating func closeWindows() {
        self.windowsState = .close
    }
    mutating func startEngine() {
        self.engineState = .on
    }
    mutating func stopEngine() {
        self.engineState = .off
    }
    mutating func loadGoodsInCar(weightOfGoods: Int) {
        if ((filledLoad + weightOfGoods) < maxLoad) {
            filledLoad = filledLoad + weightOfGoods }
        else {
            self.filledLoad = maxLoad
        }
    }
    mutating func unloadGoodsFromCar() {
        self.filledLoad = 0
    }
    func showInfo() {
        print("Экземпляр автомобиля с маркой \(self.brand) и годом выпуска \(self.releaseDate) сейчас \(self.engineState == .on ? "заведен" : "заглушен" ). Окна в машине \(self.windowsState == .open ? "открыты" : "закрыты" ). Максимальный объем багажа: \(self.maxLoad). Сейчас загружено: \(self.filledLoad)")
    }
}


struct TrunkCar {
    let brand: String
    let releaseDate: Int
    let maxLoad: Int
    var filledLoad: Int {
        willSet {
            if newValue > maxLoad {
                print("Этот груз слишком тяжелый для этого грузовика. Накидаем сверху с горкой!")
                
            } else if newValue == 0{
                    print("Сейчас грузовик будет пустым")
            } else {
                print("Начинается погрузка вашего добра в грузовик")
            }
        }
    }
    var engineState: EngineState
    var windowsState: WindowsState
    let maxSpeed: Int
    
    mutating func openWindows() {
        self.windowsState = .open
    }
    mutating func closeWindows() {
        self.windowsState = .close
    }
    mutating func startEngine() {
        self.engineState = .on
    }
    mutating func stopEngine() {
        self.engineState = .off
    }
    mutating func loadGoodsInTrunk(weightOfGoods: Int) {
        self.filledLoad = filledLoad + weightOfGoods
    }
    mutating func unloadGoodsFromCar() {
        self.filledLoad = 0
    }
    func showInfo() {
        print("Экземпляр грузовика с маркой \(self.brand) и годом выпуска \(self.releaseDate) сейчас \(self.engineState == .on ? "заведен" : "заглушен" ). Окна в машине \(self.windowsState == .open ? "открыты" : "закрыты" ). Максимальный объем багажа: \(self.maxLoad). Сейчас загружено: \(self.filledLoad)")
    }
}



enum EngineState {
    case on, off
}

enum WindowsState {
    case open, close
}

var car1 = SportCar(brand: "BMW", releaseDate: 2021, maxLoad: 200, filledLoad: 100, engineState: .off, windowsState: .close, maxSpeed: 250)
var truck1 = TrunkCar(brand: "Mercedes", releaseDate: 2020, maxLoad: 2000, filledLoad: 0, engineState: .off, windowsState: .open, maxSpeed: 200)

car1.closeWindows()
car1.openWindows()
car1.loadGoodsInCar(weightOfGoods: 990)
truck1.loadGoodsInTrunk(weightOfGoods: 2500)
car1.startEngine()
car1.showInfo()
truck1.showInfo()
