//
//  ViewController.swift
//  New Calculator
//
//  Created by M. Ahmad Ali on 03/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workingLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    var workings = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll() {
        
        workings = ""
        workingLabel.text = ""
        resultsLabel.text = ""
    }
    
    func addToWorking(for value: String) {
        workings += value
        workingLabel.text = workings
    }
    
    @IBAction func allClearTap(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func clearTap(_ sender: UIButton) {
        if (!workings.isEmpty) {
            workings.removeLast()
            workingLabel.text = workings
        }
    }
    
    @IBAction func percentageTap(_ sender: UIButton) {
        addToWorking(for: "%")
    }
    
    @IBAction func divideTap(_ sender: UIButton) {
        addToWorking(for: "/")
    }
    
    @IBAction func multiplyTap(_ sender: UIButton) {
        addToWorking(for: "*")
    }
    
    @IBAction func minusTap(_ sender: UIButton) {
        addToWorking(for: "-")
    }
    
    @IBAction func plusTap(_ sender: UIButton) {
        addToWorking(for: "+")
    }
    
    @IBAction func equalTap(_ sender: UIButton) {
        if (validInput()) {
            let checkWorkingsForPercentage = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkWorkingsForPercentage)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(for: result)
            resultsLabel.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Expression Not Complete", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
        
         
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
          
        for char in workings {
            if (specialCharacter(char: char )) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            if(index == workings.count - 1) {
                return false
            }
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "/") {
            return true
        }
        if (char == "+") {
            return true
        }
        return false
    }
    
    func formatResult(for result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.3f", result)
        }
    }
    
    @IBAction func zeroTap(_ sender: UIButton) {
        addToWorking(for: "0")
    }
    
    @IBAction func decimalTap(_ sender: UIButton) {
        addToWorking(for: ".")
    }
    
    @IBAction func oneTap(_ sender: UIButton) {
        addToWorking(for: "1")
    }
    
    @IBAction func twoTap(_ sender: UIButton) {
        addToWorking(for: "2")
    }
    
    @IBAction func threeTap(_ sender: UIButton) {
        addToWorking(for: "3")
    }
    
    @IBAction func fourTap(_ sender: UIButton) {
        addToWorking(for: "4")
    }
    
    @IBAction func fiveTap(_ sender: UIButton) {
        addToWorking(for: "5")
    }
    
    @IBAction func sixTap(_ sender: UIButton) {
        addToWorking(for: "6")
    }
    
    @IBAction func sevenTap(_ sender: UIButton) {
        addToWorking(for: "7")
    }
    
    @IBAction func eightTap(_ sender: UIButton) {
        addToWorking(for: "8")
    }
    
    @IBAction func nineTap(_ sender: UIButton) {
        addToWorking(for: "9")
    }
    
    
    
    
    
    
    
    
}
