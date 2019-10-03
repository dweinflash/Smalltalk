"Game.st"
Object subclass: Game [
    | p1 p2 |
    <comment: 'I represent the main module of the Battleship game'>

    Game class >> new [
        | r |
        <category: 'instance creation'>
        r := super new.
        r init.
        ^ r
    ]

    init [
        <category: 'initialize the objects of the game'>
        
        "load files"
        FileStream fileIn: 'Player.st'.

        "assign variables"
        p1 := Player new.
        p2 := Player new
    ]

    printOn: stream [
        "Don't print when object referenced"
    ]

    p: num putH: s atX: x atY: y [
        <category: 'Place a ship horizontally on a players ship board.
                    num = 1 or 2 to indicate Player1 or Player2 move.'>

        "s = 'Dingy', 'Cruiser', or 'Battleship'"

        "Player 1 place ship"
        (num = 1) ifTrue: [p1 placeH: s atX: x atY: y].

        "Player 2 place ship"
        (num = 2) ifTrue: [p2 placeH: s atX: x atY: y]
    ]

    p: num putV: s atX: x atY: y [
        <category: 'Place a ship vertically on a players ship board.
                    num = 1 or 2 to indicate Player1 or Player2 move.'>

        "s = 'Dingy', 'Cruiser', or 'Battleship'"

        "Player 1 place ship"
        (num = 1) ifTrue: [p1 placeV: s atX: x atY: y].

        "Player 2 place ship"
        (num = 2) ifTrue: [p2 placeV: s atX: x atY: y]
    ]

    p: num show: brd [
        <category: 'Show a players ship or guess board based on brd.
                    num = 1 or 2 to indicate Player1 or Player2 move.'>
        
        "brd = 'Ships' or 'Guesses'"

        "Player 1 show ship board"
        (num = 1) & (brd = 'Ships') ifTrue: [p1 myBoard].

        "Player 1 show guess board"
        (num = 1) & (brd = 'Guesses') ifTrue: [p1 guessBoard].
    
        "Player 2 show ship board"
        (num = 2) & (brd = 'Ships') ifTrue: [p2 myBoard].

        "Player 2 show guess board"
        (num = 2) & (brd = 'Guesses') ifTrue: [p2 guessBoard]
    ]

    p: num guessX: x guessY: y [
        <category: 'Fire at the other players board.
                    Only fire if all players ship boards have ship(s).
                    Only fire if x/y coords are valid for 8x8 board.
                    Show players guess board after guess.
                    Determine if player has won after guess.
                    num = 1 or 2 to indicate Player1 or Player2 move.'>
       
        | p1Brd p2Brd |

        p1Brd := p1 getShipBoard.
        p2Brd := p2 getShipBoard.

        "Player 1 ship board not set"
        (p1 myBoardSet) ifFalse: [^ 'Set Player 1 ships before playing.'].

        "Player 2 ship board not set"
        (p2 myBoardSet) ifFalse: [^ 'Set Player 2 ships before playing.'].

        "Invalid guess"
        (x < 1) | (x > 8) | (y < 1) | (y > 8) ifTrue: [^ 'Invalid guess on 8x8 board.'].

        "Player 1 guess"
        (num = 1) ifTrue: [p1 fireBrd: p2Brd atX: x atY: y.
                           p1 guessBoard].

        "Player 2 guess"
        (num = 2) ifTrue: [p2 fireBrd: p1Brd atX: x atY: y.
                           p2 guessBoard].

        "Player 1 wins"
        (p1 guessedAll: p2Brd) ifTrue: [Transcript cr.
                                       Transcript show: 'PLAYER 1 HAS SUNK ALL PLAYER 2 SHIPS!'.
                                       Transcript cr].

        "Player 2 wins"
        (p2 guessedAll: p1Brd) ifTrue: [Transcript cr.
                                       Transcript show: 'PLAYER 2 HAS SUNK ALL PLAYER 1 SHIPS!'.
                                       Transcript cr] 
    ]

    newGame [
        <category: 'clear each players ship board and guess board'>
        
        p1 reset.
        p2 reset
    ]

]
