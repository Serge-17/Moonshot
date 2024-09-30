//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Serge Eliseev on 28.09.2024.
//

import Foundation

// Расширение для класса Bundle, добавляющее метод декодирования JSON-файлов в любой Codable тип
extension Bundle {
    
    // Универсальный метод decode, который принимает имя файла и возвращает декодированные данные типа T
    // T должен соответствовать протоколу Codable (для поддержки кодирования/декодирования данных)
    func decode<T: Codable>(_ file: String) -> T {
        
        // Проверяем, существует ли файл с указанным именем в бандле
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")  // Завершаем выполнение программы, если файл не найден
        }

        // Пытаемся загрузить данные из файла
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")  // Завершаем выполнение программы, если данные не удалось загрузить
        }

        // Создаем декодер для преобразования JSON данных в объект типа T
        let decoder = JSONDecoder()

        // Настраиваем форматтер для работы с датами в формате "год-месяц-день"
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        
        // Устанавливаем стратегию декодирования дат для декодера
        decoder.dateDecodingStrategy = .formatted(formatter)

        do {
            // Пытаемся декодировать данные в объект типа T и возвращаем результат
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            // Обрабатываем ошибку, когда в JSON отсутствует ожидаемый ключ
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            // Обрабатываем ошибку, когда тип данных не совпадает с ожидаемым
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            // Обрабатываем ошибку, когда в JSON отсутствует значение для ожидаемого типа
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            // Обрабатываем ошибку, когда JSON данные повреждены или неверны
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            // Обрабатываем любые другие ошибки декодирования
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
