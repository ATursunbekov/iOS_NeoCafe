//
//  SearchManager.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 01/04/24.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
//    @IBOutlet weak var searchTextField: UITextField!
    let searchManager = SearchManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Назначаем делегатом текстового поля текущий контроллер
//        searchTextField.delegate = self
    }

    // Метод делегата UITextFieldDelegate, вызывается при каждом изменении текста в поле ввода
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Получаем новую строку в поле ввода, включая текущий текст и новый ввод
        if let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            // Вызываем метод поиска при каждом изменении текста в поле
            searchManager.userDidType(query: text)
        }
        // Возвращаем true, чтобы разрешить изменение текста в поле ввода
        return true
    }
}

class SearchManager {
    // Задержка для выполнения операции после последнего ввода пользователя
    private let debounceDelay: TimeInterval = 0.5
    // Таймер, отвечающий за задержку выполнения операции
    private var debounceTimer: Timer?

    // Метод, который будет вызываться после завершения задержки
    func searchDatabase(query: String) {
        // Здесь должен быть код выполнения поиска в базе данных
        print("Searching database for query: \(query)")
    }

    // Метод, вызываемый при вводе текста пользователем
    func userDidType(query: String) {
        // Отменяем предыдущий таймер, если он был запущен
        debounceTimer?.invalidate()
        // Запускаем новый таймер с задержкой
        debounceTimer = Timer.scheduledTimer(withTimeInterval: debounceDelay, repeats: false) { [weak self] _ in
            // Выполняем поиск в базе данных после завершения задержки
            self?.searchDatabase(query: query)
        }
    }
}
