import Foundation

struct AdventureNode {
    let description: String
    let outcome: String
    let isSuccess: Bool
    let nextChoices: [AdventureNode]?
}

//Pirate Path
let pirateAdventure = AdventureNode(
    description: "Become a Pirate",
    outcome: "You set sail on the high seas.",
    isSuccess: false,
    nextChoices: [
        AdventureNode(
            description: "Rob a Navy Vessel",
            outcome: "You were shot by cannons and died at sea. ☠️",
            isSuccess: false,
            nextChoices: nil
        ),
        AdventureNode(
            description: "Search for Buried Treasure",
            outcome: "You found a chest of gold! You're rich! 🏴‍☠️💰",
            isSuccess: true,
            nextChoices: nil
        )
    ]
)

//Navy Path
let navyAdventure = AdventureNode(
    description: "Join a Navy Vessel",
    outcome: "You were kidnapped by pirates! 🏴‍☠️",
    isSuccess: false,
    nextChoices: [
        AdventureNode(
            description: "Fight Back",
            outcome: "You defeated the pirates and escaped! 🗡️🚢",
            isSuccess: true,
            nextChoices: nil
        ),
        AdventureNode(
            description: "Surrender",
            outcome: "The pirates threw you overboard. You died. ⚰️",
            isSuccess: false,
            nextChoices: nil
        )
    ]
)
