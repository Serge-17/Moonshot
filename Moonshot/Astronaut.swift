//
//  Astronaut.swift
//  Moonshot
//
//  Created by Serge Eliseev on 28.09.2024.
//

import Foundation

// Структура Astronaut, которая реализует протоколы Identifiable и Codable
// Identifiable — позволяет использовать объект в SwiftUI списках и определять его уникально по id
// Codable — делает структуру доступной для кодирования и декодирования (например, для JSON)
struct Astronaut: Identifiable, Codable {
    
    // Уникальный идентификатор астронавта
    let id: String
    
    // Имя астронавта
    let name: String
    
    // Описание астронавта (биография, факты и т.д.)
    let description: String
}
