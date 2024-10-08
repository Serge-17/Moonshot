# Moonshot

**Moonshot** — это образовательное приложение, которое предоставляет информацию о космической программе Apollo, миссиях и их экипажах. В проекте используется Swift и SwiftUI для создания интерактивного интерфейса с возможностью навигации по миссиям и астронавтам.

## Особенности проекта

- Отображение списка миссий Apollo с детальной информацией.
- Возможность просмотра данных о каждом члене экипажа.
- Динамическое представление контента с использованием LazyVGrid для адаптации к размеру экрана.
- Поддержка темного режима и стилизованных фонов.

## Установка

1. Клонируйте репозиторий:
    ```bash
    git clone https://github.com/Serge-17/Moonshot.git
    ```
2. Откройте проект в Xcode:
    ```bash
    cd Moonshot
    open Moonshot.xcodeproj
    ```
3. Соберите и запустите приложение на симуляторе или реальном устройстве.

## Структура проекта

- **MoonshotApp.swift** — главный файл, в котором запускается приложение.
- **ContentView.swift** — основное представление, где отображаются миссии.
- **MissionView.swift** — детальное представление для каждой миссии.
- **AstronautView.swift** — отображение информации об астронавтах.
- **Bundle-Decoding.swift** — расширение для загрузки данных из JSON файлов.
