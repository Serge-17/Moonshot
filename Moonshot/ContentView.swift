//
//  ContentView.swift
//  Moonshot
//
//  Created by Serge Eliseev on 27.09.2024.
//
import SwiftUI

// Структура User, соответствующая протоколу Codable для кодирования и декодирования данных
struct User: Codable {
    let name: String     // Имя пользователя
    let address: Address // Адрес пользователя, представленный в виде отдельной структуры
}

// Структура Address, соответствующая протоколу Codable для кодирования и декодирования
struct Address: Codable {
    let street: String   // Улица
    let city: String     // Город
}

// Основное представление приложения
struct ContentView: View {
    
    // Загружаем данные об астронавтах из JSON файла
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    // Загружаем данные о миссиях из JSON файла
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // Определяем компоновку сетки с минимальной шириной элементов 150
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        // Используем NavigationStack для работы с навигацией в приложении
        NavigationStack {
            
            // Добавляем прокрутку для всего содержимого
            ScrollView {
                
                // LazyVGrid — используется для отображения сетки элементов с динамическими размерами
                LazyVGrid(columns: columns) {
                    
                    // Перебираем массив миссий и создаем для каждой миссии элемент сетки
                    ForEach(missions) { mission in
                        
                        // Используем NavigationLink для перехода к детальному представлению миссии
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)  // Передаем данные о миссии и астронавтах
                        } label: {
                            // Создаем VStack с изображением и текстом
                            VStack {
                                // Отображаем изображение миссии
                                Image(mission.image)
                                    .resizable()                // Позволяет изменять размер изображения
                                    .scaledToFit()              // Сохраняет пропорции изображения
                                    .frame(width: 100, height: 100)  // Задаем фиксированные размеры
                                    .padding()                 // Добавляем отступы вокруг изображения
                                
                                // Вложенный VStack для текста
                                VStack {
                                    // Название миссии
                                    Text(mission.displayName)
                                        .font(.headline)         // Задаем стиль шрифта
                                        .foregroundStyle(.white) // Белый цвет текста
                                    
                                    // Форматированная дата запуска
                                    Text(mission.formattedlaunchDate)
                                        .font(.caption)          // Меньший шрифт для даты
                                        .foregroundStyle(.gray)  // Серый цвет текста
                                }
                                .padding(.vertical)              // Вертикальные отступы
                                .frame(maxWidth: .infinity)      // Занимает всю ширину
                                .background(.lightBackground)    // Устанавливаем светлый фон
                            }
                            .clipShape(.rect(cornerRadius: 10))  // Округляем углы карточки
                            .overlay(
                                // Добавляем обводку с закругленными углами
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)  // Используем светлый фон для обводки
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])  // Отступы по горизонтали и внизу
            }
            .navigationTitle("Moonshot")          // Устанавливаем заголовок экрана
            .background(.darkBackground)          // Устанавливаем темный фон для всего экрана
            .preferredColorScheme(.dark)          // Устанавливаем темную цветовую схему
        }
    }
}

// Предпросмотр интерфейса в Xcode
#Preview {
    ContentView()
}
