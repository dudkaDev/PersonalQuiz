//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Андрей Абакумов on 08.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultOfAnswerLabel: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        animalDefinition(from: answersChosen)
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func animalDefinition(from: [Answer]) {
        var frequentAnswers: [Animal: Int] = [:]
        let responseType = answersChosen.map( { $0.animal } )

        responseType.forEach { response in
            frequentAnswers[response] = (frequentAnswers[response] ?? 0) + 1
        }
        
        let sortedFrequentAnswers = frequentAnswers.sorted(by:
        {(answerOne, answerTwo) in answerOne.value > answerTwo.value
        })
        
        let mostCommonAnswer = sortedFrequentAnswers.first!.key
        
        resultOfAnswerLabel.text = "Вы - \(mostCommonAnswer.rawValue)!"
        descriptionResultLabel.text = mostCommonAnswer.definition
    }
}
