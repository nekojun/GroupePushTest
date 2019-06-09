import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: .zero)
        button.setTitle("通知発火", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(hoge), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let category = UNNotificationCategory(identifier: "testCategory",
                                              actions: [],
                                              intentIdentifiers: [],
                                              hiddenPreviewsBodyPlaceholder: nil,
                                              categorySummaryFormat: "%u 件のメッセージ by %@.",
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
//        UNUserNotificationCenter.current().delegate = self
    }
    
    @objc private func hoge() {
        
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "World!"
        content.threadIdentifier = "test"
        content.categoryIdentifier = "testCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }


}
