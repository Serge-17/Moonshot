//
//  Mission.swift
//  Moonshot
//
//  Created by Serge Eliseev on 28.09.2024.
//

import Foundation

// Структура Mission, соответствующая протоколам Codable (для кодирования/декодирования) и Identifiable (для уникальной идентификации)
struct Mission: Codable, Identifiable {
    
    // Вложенная структура CrewRole, которая описывает каждого члена экипажа и его роль
    struct CrewRole: Codable {
        let name: String  // Имя члена экипажа
        let role: String  // Роль, которую он выполняет
    }
    
    let id: Int               // Уникальный идентификатор миссии (номер Apollo)
    let launchDate: Date?      // Дата запуска, может быть nil если дата неизвестна
    let crew: [CrewRole]       // Список членов экипажа с их ролями
    let description: String    // Описание миссии
    
    // Свойство, возвращающее имя миссии (например, "Apollo 11")
    var displayName: String {
        "Apollo \(id)"
    }
    
    // Свойство для получения имени изображения миссии
    var image: String {
        "apollo\(id)"          // Имя изображения соответствует id миссии (например, "apollo11")
    }
    
    // Свойство, которое возвращает отформатированную дату запуска в сокращенном виде
    var formattedlaunchDate: String {
        // Используем встроенный метод для форматирования даты, если она есть; иначе возвращаем "N/A"
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
