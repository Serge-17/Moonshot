//
//  Color-Tehme.swift
//  Moonshot
//
//  Created by Serge Eliseev on 30.09.2024.
//
import SwiftUI

// Расширение для протокола ShapeStyle, ограниченное типом Self равным Color
// Это расширение добавляет кастомные цвета для фонов
extension ShapeStyle where Self == Color {
    
    // Статическое свойство для темного фона
    // Возвращает цвет с низкими значениями RGB, что создает темный синий оттенок
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    // Статическое свойство для светлого фона
    // Возвращает чуть более светлый оттенок синего для фона
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
