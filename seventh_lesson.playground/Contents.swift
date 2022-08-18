import UIKit

// Ошибка
enum LessonsError: Error {case empty}

// Класс с испольованием пробрасывания ошибки
class CustomError {
    func getSocketError() throws {
        throw LessonsError.empty
    }
}

let customError: CustomError = CustomError()
do {
    try customError.getSocketError()
} catch LessonsError.empty {
    print("ban")
}

// Класс с использованием if let
class DataRepository {
    func fetchData(withErrors: Bool) -> String? {
        if (withErrors){
            if let data = try? fetchDataFromServer() { return data }
        } else{
            if let data = try? fetchDataFromDisk() { return data }
        }
        return nil
    }
    
    func fetchDataFromDisk() throws -> String {
        return "hi"
    }
    
    func fetchDataFromServer() throws -> String {
        throw LessonsError.empty
    }
}

let dataRepository : DataRepository = DataRepository()
dataRepository.fetchData(withErrors: true);
dataRepository.fetchData(withErrors: false);
