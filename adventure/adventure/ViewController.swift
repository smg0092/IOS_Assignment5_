import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var endLabel: UILabel!

    var currentNode: AdventureNode?
    let rootChoices: [AdventureNode] = [pirateAdventure, navyAdventure]

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resetGame))
        endLabel.isUserInteractionEnabled = true
        endLabel.addGestureRecognizer(tapGesture)
        showRootChoices()
    }

    func showRootChoices() {
        outcomeLabel.text = "Choose your path:"
        currentNode = nil

        choiceButton1.setTitle(rootChoices[0].description, for: .normal)
        choiceButton2.setTitle(rootChoices[1].description, for: .normal)
        choiceButton1.isHidden = false
        choiceButton2.isHidden = false
        endLabel.text = ""
    }

    func updateUI(for node: AdventureNode) {
        outcomeLabel.text = node.outcome

        if let choices = node.nextChoices {
            choiceButton1.setTitle(choices[0].description, for: .normal)
            choiceButton1.isHidden = false

            if choices.count > 1 {
                choiceButton2.setTitle(choices[1].description, for: .normal)
                choiceButton2.isHidden = false
            } else {
                choiceButton2.isHidden = true
            }

            endLabel.text = ""
        } else {
            choiceButton1.isHidden = true
            choiceButton2.isHidden = true

            let baseMessage = node.isSuccess ? "🎉 You won!" : "☠️ Game over"
            endLabel.text = "\(baseMessage)\n\nTap here to restart."
        }
    }
    
    @objc func resetGame() {
        showRootChoices()
    }


    @IBAction func choice1Tapped(_ sender: UIButton) {
        if currentNode == nil {
            currentNode = rootChoices[0]
        } else {
            currentNode = currentNode?.nextChoices?[0]
        }
        if let node = currentNode {
            updateUI(for: node)
        }
    }

    @IBAction func choice2Tapped(_ sender: UIButton) {
        if currentNode == nil {
            currentNode = rootChoices[1]
        } else {
            currentNode = currentNode?.nextChoices?[1]
        }
        if let node = currentNode {
            updateUI(for: node)
        }
    }
}
