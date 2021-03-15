enum Hand: CaseIterable {
    case rock
    case paper
    case scissors
}
enum Result: String {
    case win = ". you win!"
    case lose = ". you lose"
    case draw = ". you draw"
}

func janken(you: Hand) {
    
    if let cp: Hand = (Hand.allCases.randomElement()) {
    
        if (you == .rock) && (cp == .scissors) || (you == .scissors) && (cp ==  .paper) || (you == .paper) && (cp == .rock) {
            print("// cp: \(cp)\(Result.win.rawValue)")
        } else if (you == cp) {
            print("// cp: \(cp)\(Result.draw.rawValue)")
        } else {
            print("// cp: \(cp)\(Result.lose.rawValue)")
        }
    }
}

let HandType = [Hand.paper, Hand.rock, Hand.scissors]

for i in 0..<HandType.count {
    print("janken(you:.\(HandType[i]))")
    janken(you: HandType[i])
}
