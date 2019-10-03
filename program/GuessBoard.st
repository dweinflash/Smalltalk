"GuessBoard.st"
Board subclass: GuessBoard [

    init [
        <category: 'initialization'>
        self clear
    ]

    clear [
        <category: 'initialize an 8x8 game board with all blanks'>
        "first array is rows, second array is columns"

        "initialize rows"
        board := (Array new: 8).
 
        "initialize columns"
        1 to: board size 
        do: [:index | board at: index put: ((Array new: 8) 
            at: 1 put: '_'; at: 2 put: '_'; at: 3 put: '_'; at: 4 put: '_'; 
            at: 5 put: '_'; at: 6 put: '_'; at: 7 put: '_'; at: 8 put: '_'; yourself).]
    ]

]
