//
//  ResultsViewController.swift
//  personalityQuiz
//
//  Created by Tyler May on 9/18/23.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true

        
    }
    
    func calculatePersonalityResults() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        

        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

 
    @IBAction func doneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    

}
