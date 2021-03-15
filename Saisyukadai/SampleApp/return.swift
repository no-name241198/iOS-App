
import UIKit
 
class DismissSegue: UIStoryboardSegue {
 
    override func perform() {
        self.source.dismiss(animated: true, completion: nil)
    }
 
}
