//
//  AstronautView.swift
//  Moonshot
//
//  Created by Serge Eliseev on 30.09.2024.
//

import SwiftUI

// Представление AstronautView, которое отображает информацию об астронавте
struct AstronautView: View {
    
    // Экземпляр структуры Astronaut, передаваемый в представление
    let astronaut: Astronaut

    var body: some View {
        ScrollView {
            // Используем VStack для вертикальной компоновки элементов
            VStack {
                // Изображение астронавта, загружается по его идентификатору
                Image(astronaut.id)
                    .resizable()          // Позволяет изменять размер изображения
                    .scaledToFit()        // Масштабирует изображение, сохраняя его пропорции

                // Описание астронавта, выводимое в текстовом поле
                Text(astronaut.description)
                    .padding()           // Добавляем отступы вокруг текста
            }
        }
        .background(.darkBackground)        // Устанавливаем фон с темной цветовой схемой
        .navigationTitle(astronaut.name)    // Устанавливаем имя астронавта в заголовок навигации
        .navigationBarTitleDisplayMode(.inline)  // Отображаем заголовок в компактном режиме
    }
}

// Предпросмотр представления в Xcode (только для разработки)
#Preview {
    // Загружаем данные об астронавтах из JSON файла
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    // Возвращаем представление для конкретного астронавта (в данном случае Buzz Aldrin)
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)  // Устанавливаем темную цветовую схему для предпросмотра
}
