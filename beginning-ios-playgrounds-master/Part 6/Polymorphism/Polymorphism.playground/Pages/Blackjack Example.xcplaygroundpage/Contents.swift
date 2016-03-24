//: [Previous](@previous)
/*:
## Blackjack Example
*/

import Foundation

//: ### PlayingCard protocol
protocol PlayingCard {
    var isFaceDown: Bool { get set }
    var shortName: String { get }
}

//: ### SuitedCard is-a PlayingCard
struct SuitedCard: PlayingCard {
    enum Suit {
        case Hearts
        case Spades
        case Diamonds
        case Clubs
    }
    
    enum Value {
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        case Ten
        case Jack
        case Queen
        case King
        case Ace
    }
    
    let suit: Suit
    let value: Value
    var isFaceDown: Bool
    
    var suitDisplay: String {
        switch self.suit {
        case .Hearts:
            return "♥"
        case .Spades:
            return "♠"
        case .Diamonds:
            return "♦"
        case .Clubs:
            return "♣"
        }
    }
    
    var valueDisplay: String {
        switch self.value {
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Five:
            return "5"
        case .Six:
            return "6"
        case .Seven:
            return "7"
        case .Eight:
            return "8"
        case .Nine:
            return "9"
        case .Ten:
            return "10"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        case .Ace:
            return "A"
        }
    }
    
    var shortName: String {
        if isFaceDown {
            return "???"
        }
        
        if valueDisplay.characters.count == 1 {
            // Add a space so the width is always three.
            return "\(suitDisplay) \(valueDisplay)"
        }
        
        return "\(suitDisplay)\(valueDisplay)"
    }
}

let suits: [SuitedCard.Suit] = [.Hearts, .Diamonds, .Clubs, .Spades]
let values: [SuitedCard.Value] = [.Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King, .Ace]

//: ### Deck struct
struct Deck {
    var cards: [SuitedCard] = []
    
    init() {
        for suit in suits {
            for value in values {
                cards.append(SuitedCard(suit: suit, value: value, isFaceDown: true))
            }
        }
        shuffle()
    }
    
    mutating func shuffle() {
        for var i:Int = 0; i < cards.count - 1; i++ {
            let swapIndex = (Int(arc4random()) % cards.count - i) + i
            (cards[swapIndex], cards[i]) = (cards[i], cards[swapIndex])
        }
    }
}

//: ### BlackjackPlayer class
class BlackjackPlayer {
    var hand: [SuitedCard] = []
    
    // TODO: implement playTurn
    func playTurn(dealer: Dealer) {
        // decide whether to hit or stand
    }
    
    func hit(dealer: Dealer) {
        dealer.hit(self)
    }
    
    func stand(dealer: Dealer) {
        dealer.stand(self)
    }
    
    // total when counting Aces as 1
    private var lowTotal: Int {
        var total = 0
        for card in hand {
            switch card.value {
            case .Ace:
                total += 1
            case .Two:
                total += 2
            case .Three:
                total += 3
            case .Four:
                total += 4
            case .Five:
                total += 5
            case .Six:
                total += 6
            case .Seven:
                total += 7
            case .Eight:
                total += 8
            case .Nine:
                total += 9
            case .Ten, .Jack, .Queen, .King:
                total += 10
            }
        }
        return total
    }
    
    // TODO: implement highTotal computed property
    private var highTotal: Int {
        // write code to calculate total when counting Aces as 11
        return 0
    }
    
    func hasBusted() -> Bool {
        return highTotal > 21
    }
}

//: ### The Dealer class is-a BlackjackPlayer and it inherits all its properties/methods.
class Dealer: BlackjackPlayer {
    var deck = Deck()
    let opponents: [BlackjackPlayer]
    var roundNumber = 1
    var activeOpponentIndex: Int = 0
    
    init(opponents: [BlackjackPlayer]) {
        self.opponents = opponents
    }
    
    func startGame() {
        // Deal a hand to my opponents and myself.
        for player in opponents {
            dealTo(player)
        }
        dealTo(self)
        
        // Start with player "0"
        activeOpponentIndex = 0
        opponents[activeOpponentIndex].playTurn(self)
    }
    
    func dealTo(player: BlackjackPlayer) {
        if let card = deck.cards.popLast(),
            var faceUp = deck.cards.popLast()
        {
            faceUp.isFaceDown = false
            player.hand = [card, faceUp]
        }
    }
    
    // TODO: implement playTurn
    override func playTurn(dealer: Dealer) {
        // the blackjack dealer always has to hit if hand is < 17 points, otherwise stand
    }
    
    override func hit(player: BlackjackPlayer) {
        if var card = deck.cards.popLast() {
            card.isFaceDown = false
            player.hand.append(card)
        }
    }
    
    override func stand(player: BlackjackPlayer) {
        if let _ = player as? Dealer {
            // I (the dealer) just finished my turn. Time to see who the winner is!
            endRound()
        } else if activeOpponentIndex < opponents.count - 1 {
            // It's the next player's turn.
            activeOpponentIndex += 1
            opponents[activeOpponentIndex].playTurn(self)
        } else {
            // It's the dealer's turn (my turn).
            playTurn(self)
        }
    }
    
    // TODO: implement endRound
    func endRound() {
        // determine a winner
        
        
        // reshuffle the deck
        for player in opponents + [self] {
            for var card in player.hand {
                card.isFaceDown = true
                deck.cards.append(card)
            }
            player.hand = []
        }
        roundNumber += 1
        deck.shuffle()
    }
}

/*

// Uncomment when ready.

let opponents = [BlackjackPlayer(), BlackjackPlayer(), BlackjackPlayer(), BlackjackPlayer()]
let dealer = Dealer(opponents: opponents)

dealer.startGame()

*/
