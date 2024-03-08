import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/(height*height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        } else if bmiValue < 25.0 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat fewer pies!", color: UIColor.red)
        }
    }
    
    func getBMI() -> String {
        let bmiValue = String(format : "%.1f", bmi?.value ?? 0.00)
        return bmiValue
    }
    
    func getBMIAdvice() -> String? {
        let bmiAdvice = bmi?.advice
        return bmiAdvice
    }
    
    func getBMIColor() -> UIColor? {
        let bmiColor = bmi?.color
        return bmiColor
    }
}
