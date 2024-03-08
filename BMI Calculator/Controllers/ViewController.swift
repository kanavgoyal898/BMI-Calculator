import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let precision = 100.0
        let height = round(Double(sender.value) * precision) / precision;
        heightLabel.text = String("\(height) m");
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(round(sender.value))
        weightLabel.text = String("\(weight) kg");
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = String(format : "%.1f", weight/(height*height))
        print(bmi)
        
        
    }
    
}

