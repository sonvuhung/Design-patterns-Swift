protocol Game {
    func initialize()
    func startPlay()
    func endPlay()
}

class Cricket: Game {
    
    func initialize() {
        print("Cricket game Initialized!")
    }
    
    func startPlay() {
        print("Cricket game Started! Enjoy the game!")
    }
    
    func endPlay() {
        print("Cricket game Finished!")
    }
}

class Football: Game {
    
    func initialize() {
        print("Football game Initialized!")
    }
    
    func startPlay() {
        print("Football game Started! Enjoy the game!")
    }
    
    func endPlay() {
        print("Football game Finished!")
    }
}

//Template closure
let playGame = { (game: Game) in
    game.initialize()
    game.startPlay()
    game.endPlay()
}

//DEMO

playGame(Cricket())
print()
playGame(Football())
