"Player.st"
Object subclass: Player [
    | brd gbrd dngy crzr bshp |
    <comment: 'I represent a Player in the Battleship game'>

    Player class >> new [
        | r |
        <category: 'instance creation'>
        r := super new.
        r init.
        ^ r
    ]

    init [
        <category: 'initialize the Player objects'>
        
        "load files"
        FileStream fileIn: 'Board.st'.
        FileStream fileIn: 'GuessBoard.st'.
        FileStream fileIn: 'Ship.st'.
        FileStream fileIn: 'Dingy.st'.
        FileStream fileIn: 'Cruiser.st'.
        FileStream fileIn: 'Battleship.st'.

        "assign variables"
        brd := Board new.
        gbrd := GuessBoard new.
        dngy := Dingy new.
        crzr := Cruiser new.
        bshp := Battleship new.
    ]

    printOn: stream [
        "Don't print when object referenced"
    ]

    placeH: s atX: x atY: y [
        <category: 'place a ship horizontally on players ship board'>

        "Place Dingy"
        (s = 'Dingy') ifTrue: [dngy placeH: brd atX: x atY: y].

        "Place Cruiser"
        (s = 'Cruiser') ifTrue: [crzr placeH: brd atX: x atY: y].

        "Place Battleship"
        (s = 'Battleship') ifTrue: [bshp placeH: brd atX: x atY: y]
    ]

    placeV: s atX: x atY: y [
        <category: 'place a ship vertically on players ship board'>

        "Place Dingy"
        (s = 'Dingy') ifTrue: [dngy placeV: brd atX: x atY: y].

        "Place Cruiser"
        (s = 'Cruiser') ifTrue: [crzr placeV: brd atX: x atY: y].

        "Place Battleship"
        (s = 'Battleship') ifTrue: [bshp placeV: brd atX: x atY: y]
    ]

    myBoard [
        <category: 'show the players ship board'>
        brd display
    ]

    myBoardSet [
        <category: 'determine if ships placed on players ship board'>
        ^(brd numOnes > 0)
    ]

    getShipBoard [
        <category: 'return the players ship board'>
        ^brd
    ]

    fireBrd: othBrd atX: x atY: y [
        <category: 'Fire at x/y coords on other players board. 
                    Update guess board with hit (1) or miss (0).'>

        "Update guess board with 1 if guess is a hit"
        (othBrd shipX: x shipY: y) ifTrue: [gbrd placeX: x placeY: y].

        "Update guess board with 0 if guess is a miss"
        (othBrd emptyX: x emptyY: y) ifTrue: [gbrd remX: x remY: y]  
    ]

    guessBoard [
        <category: 'show the players guess board'>
        gbrd display
    ]

    guessedAll: othBrd [
        <category: 'determine if # of 1s on guess board match
                    the # of 1s on the other players board.'>
        
        ^((gbrd numOnes) = (othBrd numOnes))
    ]

    reset [
        <category: 'clear the players ship board and guess board'>

        brd clear.
        gbrd clear
    ]

]
