"Board.st"
Object subclass: Board [
    | board |
    <comment: 'I represent the Battleship game board.'>

    Board class >> new [
        | r |
        <category: 'instance creation'>
        r := super new.
        r init.
        ^r
    ]

    printOn: stream [
        <category: 'printing'>
        "print nothing when referencing class"
    ]

    init [
        <category: 'initialization'>
        self clear
    ]

    clear [
        <category: 'initialize an 8x8 game board with all 0s'>
        "first array is rows, second array is columns"

        "initialize rows"
        board := (Array new: 8).
 
        "initialize columns"
        1 to: board size 
        do: [:index | board at: index put: ((Array new: 8) 
            at: 1 put: 0; at: 2 put: 0; at: 3 put: 0; at: 4 put: 0; 
            at: 5 put: 0; at: 6 put: 0; at: 7 put: 0; at: 8 put: 0; yourself).]
    ]

    display [
        <category: 'show the game board'>

        "print empty line before game board"
        Transcript show: ' '.
        Transcript cr.

        "print each space from each row/column"
        1 to: board size
        do: [:i | 
            
            1 to: board size
                do: [:j | Transcript show: ((board at: i) at: j) printString].
            
            Transcript show: ' '.
            Transcript cr
        ]
    ]

    numOnes [
        <category: 'determine the number of ship pieces on the board'>
        | num |

        num := 0.

        "count each space from each row/column"
        1 to: board size
        do: [:y |

            1 to: board size
                do: [:x | (self shipX: x shipY: y) ifTrue: [num := num + 1]].

        ].

        ^num
    ]

    emptyX: x emptyY: y [
        <category: 'determine if space at x/y on board is open water'>
        | row space |

        row := board at: y.
        space := row at: x.
        ^(space = 0)
    ]

    shipX: x shipY: y [
        <category: 'determine if space at x/y on board is a ship piece'>
        | row space |

        row := board at: y.
        space := row at: x.
        ^(space = 1)
    ]

    placeX: x placeY: y [
        <category: 'put a 1 at x/y space on board to indicate part of a ship'>
        | row |

        "get row"
        row := board at: y.
        
        "set space on row"
        row at: x put: 1.

        "set row back on board"
        board at: y put: row
    ]

    remX: x remY: y [
        <category: 'put a 0 at x/y space on board to set open water'>
        | row |

        "get row"
        row := board at: y.

        "set space on row"
        row at: x put: 0.

        "set row back on board"
        board at: y put: row
    ]

]
