import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //Will round to the 2nd decimal value
        let height = String(format: "%.1f", sender.value)
        heightLabel.text = "\(height)m"
    }
   
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //Set constant for weight to be able to put kg after
        let weight = String(Int(sender.value))
        weightLabel.text = "\(weight)kg"
    }
    //Will be triggered when cliced on calculate
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Picking .value because of xml
        let height = (heightSlider.value)
        let weight = (weightSlider.value)
        
        
        calculatorBrain.calcualteBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

