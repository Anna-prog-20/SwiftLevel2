import UIKit

class Home: UIViewController {
    @IBOutlet weak var greeting: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greeting.text = "Добро пожаловать!!!"
    }
}
