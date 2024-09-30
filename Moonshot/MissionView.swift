//
//  MissionView.swift
//  Moonshot
//
//  Created by Serge Eliseev on 30.09.2024.
//
import SwiftUI

// Представление MissionView, которое отображает информацию о конкретной миссии и её экипаже
struct MissionView: View {
    
    // Вложенная структура для представления члена экипажа с его ролью и данными об астронавте
    struct CrewmMember {
        let role: String        // Роль члена экипажа (например, командир)
        let astronaut: Astronaut // Данные о конкретном астронавте
    }
    
    let mission: Mission      // Данные о миссии, которая отображается
    let crew: [CrewmMember]   // Список членов экипажа, переданный в представление
    
    var body: some View {
        ScrollView {
            VStack {
                // Отображение изображения миссии
                Image(mission.image)
                    .resizable()                  // Позволяет изменять размер изображения
                    .scaledToFit()                // Сохраняет пропорции изображения
                    .containerRelativeFrame(.horizontal) { width, axis in width * 0.6 } // Задает ширину изображения относительно экрана
                
                Spacer() // Разделитель между изображением и текстом
                
                // Отображение даты запуска миссии
                Text(mission.formattedlaunchDate)
                
                VStack(alignment: .leading) {
                    // Разделитель в виде прямоугольника
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    // Заголовок "Mission Highlights"
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    // Описание миссии
                    Text(mission.description)
                    
                    // Еще один разделитель
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    // Заголовок "Crew"
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                // Горизонтальный ScrollView для отображения членов экипажа
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        // Перебираем список экипажа и отображаем каждого члена
                        ForEach(crew, id: \.role) { crewMember in
                            // NavigationLink для перехода к детальному представлению астронавта
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    // Изображение астронавта в форме капсулы
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1) // Обводка капсулы
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        // Имя астронавта
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        // Роль астронавта в миссии
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal) // Отступы для каждого элемента экипажа
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        // Настройки навигации
        .navigationTitle(mission.displayName)       // Заголовок экрана — название миссии
        .navigationBarTitleDisplayMode(.inline)     // Заголовок отображается в компактном виде
        .background(.darkBackground)                // Темный фон для всего экрана
    }
    
    // Инициализатор, который принимает данные о миссии и астронавтах
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        // Формируем список экипажа, связывая имя астронавта с его данными
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewmMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)") // Если данные об астронавте отсутствуют, выбрасываем ошибку
            }
        }
    }
}

// Предпросмотр интерфейса в Xcode
#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")    // Загружаем данные о миссиях
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")  // Загружаем данные об астронавтах
    
    // Возвращаем предварительный просмотр MissionView с первыми данными из JSON
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)  // Устанавливаем темную цветовую схему для предпросмотра
}
