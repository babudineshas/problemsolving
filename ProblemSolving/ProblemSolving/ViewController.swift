//
//  ViewController.swift
//  ProblemSolving
//
//  Created by Dinesh Babu on 11/11/20.
//  Copyright © 2020 Dinesh. All rights reserved.
//

import UIKit

extension String {
//    subscript(i: Int) -> String {
//         return String(self[index(startIndex, offsetBy: i)])
//    }
    
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}


class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak private var inputStringTxtView: UITextView!
    @IBOutlet weak private var inputIntegerTxtField: UITextField!
    
    @IBOutlet weak private var outputStringTxtView: UITextView!
    
    @IBOutlet weak private var timeTakenLbl: UILabel!
    
    @IBOutlet weak private var solutionSegCtrl: UISegmentedControl!
    
    // with default value of Character '\u0000' (or 0)
    //static private var ALPHA_MOVES: [[Character]] = [[Character]](repeating: [Character](repeating: "\u{0000}", count: 26), count: 26)
    //static private var ALPHA_MOVES = Array(repeating: Array(repeating: "", count: 26), count: 26)
    static private var ALPHA_MOVES: [[Character]] = [[]]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputStringTxtView.text = "abcdefghijklmnopqrstuvwxyz"
        inputIntegerTxtField.text = "1"
        
        ViewController.ALPHA_MOVES = [
            ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],
            ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a"],
            ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b"],
            ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c"],
            ["e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d"],
            ["f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e"],
            ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f"],
            ["h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g"],
            ["i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h"],
            ["j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i"],
            ["k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"],
            ["l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"],
            ["m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"],
            ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"],
            ["o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"],
            ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"],
            ["q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"],
            ["r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"],
            ["s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"],
            ["t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"],
            ["u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"],
            ["v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u"],
            ["w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"],
            ["x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"],
            ["y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"],
            ["z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"]
        ]
        
        //initAlphaMoves()
        //initAlphaMovesToPrepare()
    }
    
    func initAlphaMoves() {
        for row in 0..<ViewController.ALPHA_MOVES.count {
            var rowString: String = ""
            for col in 0..<ViewController.ALPHA_MOVES[0].count {
                // let newCharVal: Int = ((Int($0.asciiValue! % 96) + (inputInteger % 26)) % 26) + 96
                let c = Character(UnicodeScalar(((row + col) % 26) + 97)!)
                ViewController.ALPHA_MOVES[row][col] = c
                rowString.append(c)
                rowString.append(" ")
            }
            print("\(rowString)")
        }
    }
    
    func initAlphaMovesToPrepare() {
        var allRows: String = ""
        
        for row in 0..<ViewController.ALPHA_MOVES.count {
            var rowString: String = ""
            for col in 0..<ViewController.ALPHA_MOVES[0].count {
                // let newCharVal: Int = ((Int($0.asciiValue! % 96) + (inputInteger % 26)) % 26) + 96
                let c = Character(UnicodeScalar(((row + col) % 26) + 97)!)
                ViewController.ALPHA_MOVES[row][col] = c
                
                rowString.append("\"\(c)\"")
                if col < ViewController.ALPHA_MOVES[0].count-1 {
                    rowString.append(", ")
                }
            }
            allRows.append("[\(rowString)]")
            if row < ViewController.ALPHA_MOVES.count-1 {
                allRows.append(",\n")
            }
        }
        
        print(allRows)
    }
}

extension ViewController: UITextViewDelegate, UITextFieldDelegate {
    
    @IBAction func onProcess(_ sender: UIButton) {
        view.endEditing(true)
        
        var ipErrMsg: String = ""
        
        if inputStringTxtView.text.count == 0 {
            ipErrMsg += "\nInput String"
        }
        
        if inputIntegerTxtField.text?.count == 0 {
            ipErrMsg += "\nInput Integer"
        }
        
        if ipErrMsg.count > 0 {
            toast(ipErrMsg.trim())
            return
        }
        
        let startTime = Date()
        
        let inputString: String = inputStringTxtView.text
        let inputInteger: Int = Int(inputIntegerTxtField.text ?? "") ?? 0
        
        var resultString: String = ""
        
        switch solutionSegCtrl.selectedSegmentIndex {
            case 0:
                resultString = method_001(inputString, inputInteger)
            case 1:
                resultString = method_002(inputString, inputInteger)
            case 2:
                resultString = method_003(inputString, inputInteger)
            default:
                print("other solutions..")
        }        
        
        let endTime = Date()
        
        let timeTaken = Int(endTime.timeIntervalSince(startTime) * 1000 * 1000)
        timeTakenLbl.text = "\(timeTaken)"
        
        outputStringTxtView.text = resultString
    }
    
    func method_003(_ inputString: String, _ inputInteger: Int) -> String {
        //print("String: \(inputString), Integer: \(inputInteger)")
        
        var noOfMoves: Int = inputInteger % 26
        if noOfMoves < 0 {
            noOfMoves = noOfMoves + 26
        }
        
        let resultString = inputString.map {
            return String(ViewController.ALPHA_MOVES[Int($0.asciiValue! % 97)][noOfMoves])
        }.joined()

        return resultString
    }
    
    func method_002(_ inputString: String, _ inputInteger: Int) -> String {
        //print("String: \(inputString), Integer: \(inputInteger)")
        
        var noOfMoves: Int = inputInteger % 26
        if noOfMoves < 0 {
            noOfMoves = noOfMoves + 26
        }
        
        let resultString = inputString.map( {
            let newCharVal: Int = ((Int($0.asciiValue! % 97) + noOfMoves) % 26) + 97
            return String(UnicodeScalar(newCharVal)!)
        } ).joined()

        return resultString
    }
    
    func method_001(_ inputString: String, _ inputInteger: Int) -> String {
        //print("String: \(inputString), Integer: \(inputInteger)")
        
        var noOfMoves: Int = inputInteger % 26
        if noOfMoves < 0 {
            noOfMoves = noOfMoves + 26
        }
        
        let resultString = inputString.map( {
            var newCharVal: Int = Int($0.asciiValue!) + (noOfMoves)
            
            if newCharVal > 122 {
                //newCharVal = (newCharVal % 122) + 97  - 1
                newCharVal = (newCharVal % 122) + 96
            }
            
            return String(Unicode.Scalar(newCharVal)!)
        } ).joined()

        return resultString
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == inputStringTxtView {
            textView.text = textView.text.lowercased()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView == inputStringTxtView {
            let newText = Utils.getNewText(textView, range, text)
            return Utils.isAlphabets(newText)
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = Utils.getNewText(textField, range, string)
        
//        if textField == inputIntegerTxtField {
//            return newText.count == 0 ||
//                (newText.isInt && newText.count < "\(Int.max)".count)
//        }
        
        if textField == inputIntegerTxtField {
            if string == "-" {
                return textField.text?.hasPrefix("-") == false
            }

            return newText.count == 0 || newText == "-" ||
                (newText.isInt && newText.replacingOccurrences(of: "-", with: "").count < "\(Int.max)".count)
        }
        
        return true
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var isUInt: Bool {
        return UInt(self) != nil
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

extension UIViewController {
    func toast(_ message: String) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: (UIDevice.current.userInterfaceIdiom == .pad) ? .alert : .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("toast ok")
            alert.dismiss(animated: true)
        }))
        
        self.present(alert, animated: true)

        // duration in seconds
        let duration: Double = 2

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}

class Utils {
    static func getNewText(_ textInputView: Any, _ range: NSRange, _ string: String) -> String {
        var currentText = ""
        
        switch textInputView {
            case is UITextField:
                currentText = (textInputView as! UITextField).text ?? ""
            case is UITextView:
                currentText = (textInputView as! UITextView).text ?? ""
            default:
                currentText = ""
        }
        
        guard let stringRange = Range(range, in: currentText) else { return "" }
        
        let newText = currentText.replacingCharacters(in: stringRange, with: string)
        return newText
    }
    
    static func isAlphabets(_ string: String) -> Bool {
        let updatedStringCS: CharacterSet = CharacterSet(charactersIn: string)
        return CharacterSet.letters.isSuperset(of: updatedStringCS)
    }
}

