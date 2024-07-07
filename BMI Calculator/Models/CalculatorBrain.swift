import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let r, g, b, a: CGFloat
        if hexString.count == 8 {
            r = CGFloat((color & 0xff000000) >> 24) / 255
            g = CGFloat((color & 0x00ff0000) >> 16) / 255
            b = CGFloat((color & 0x0000ff00) >> 8) / 255
            a = CGFloat(color & 0x000000ff) / 255
        } else {
            r = CGFloat((color & 0xff0000) >> 16) / 255
            g = CGFloat((color & 0x00ff00) >> 8) / 255
            b = CGFloat(color & 0x0000ff) / 255
            a = 1.0
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/(height*height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(hex: "c2bbf0"))
        } else if bmiValue < 25.0 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(hex: "62b6cb"))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat fewer pies!", color: UIColor(hex: "1b4965"))
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
