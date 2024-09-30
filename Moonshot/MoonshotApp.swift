//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by Serge Eliseev on 27.09.2024.
//

import SwiftUI

// Главная точка входа в приложение Moonshot
@main
struct MoonshotApp: App {
    
    // Тело приложения, описывающее сцену для отображения
    var body: some Scene {
        // WindowGroup — это контейнер, который управляет окнами приложения на различных устройствах
        WindowGroup {
            // ContentView — это основное представление, которое отображается при запуске приложения
            ContentView()
        }
    }
}
