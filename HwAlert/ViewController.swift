// MARK: TASKS

// 1.Написать свое мини приложение на первом экране две кнопки "сложение" и "угадай число" ✅
// 2. При попадании на этот экран запрашивать ФИО через алер и отображать в UILabel ✅
// 3. По нажатию на "сложение" открывать Алерт который просит ввести число 1 и число 2 и кнопка посчитать выводит результат в любом виде юзеру ✅
// 4. При нажатии на кнопку "угадай число" нужно придумать игру где нужно угадать число ✅
// 5. Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
// 6. Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете контролеру а контролер отдаст это в модель которая из буквосочетания "leohl" вернет слово "hello" контролеру а контролер отдаст это лейблу и отобразит это на экране
// 7. Все кодом пишем!

// MARK: RELEASE
import UIKit

class ViewController: UIViewController {

    // MARK: LABELS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        nameAlert(title: "Перед началом работы с приложением", message: "Введите ваше ФИО", style: .alert)
    }

    @IBAction func sumButton(_ sender: Any) {
        sumAlert(title: "Введите числа", message: "", style: .alert)
    }

    @IBAction func guessNumberButton(_ sender: Any) {
        guessNumberAlert(title: "Угадай случайно загаданое число", message: "Диапазон от 0 до 10", style: .alert)
    }

    // MARK: ALERTS

    // name
    func nameAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Продолжить", style: .default) { _ in
            let text = alertController.textFields?.first
            self.nameLabel.text! = (text?.text)!
        }

        alertController.addTextField { _ in

        }

        alertController.addAction(action)
        present(alertController, animated: true)
    }

    // sum
    func sumAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Посчитать", style: .default) { _ in
            let num = alertController.textFields?.first
            let secondNum = alertController.textFields?[1]
            self.sumLabel.text! = "Сумма = " + String(Int(num?.text ?? "nil")! + Int(secondNum?.text ?? "nil")!)
        }

        alertController.addTextField { _ in
        }
        alertController.addTextField { _ in
        }

        alertController.addAction(action)
        present(alertController, animated: true)
    }

    // guess the number
    func guessNumberAlert(title: String, message: String, style: UIAlertController.Style) {
        
        // Variables
        let randomNum = Int.random(in: 0...10)
        var correctAnswer = false
        
        // Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Проверить", style: .default) { _ in
            let userNum = alertController.textFields?.first
            
            // Check the user answer with random number
            if (userNum?.text == String(randomNum)) {
                correctAnswer = true
            } else {
                correctAnswer = false
            }
            
            self.guessLabel.text! = "Ответ: " + String(correctAnswer)
        }
        
        alertController.addTextField { _ in
            
        }
        
        // Add actions
        alertController.addAction(action)
        
        // Add to view hierarchy
        present(alertController, animated: true)
    }
}
