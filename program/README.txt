Make sure GNU Smalltalk is installed on your system.
    sudo apt-get update
    sudo apt-get install gnu-smalltalk

How to play Battleship:

    1)  make

    2)  Start a new game by creating an instance of the Game class:

        ex)
                g := Game new

    3)  Player 1 sets his/her Ship Board.
        Ship pieces include 'Dingy', 'Cruiser' and 'Battleship'.
        
            Dingy = 3 spaces
            Cruiser = 4 spaces
            Battleship = 5 spaces

        Water is represented with 0s on the 8x8 Ship Board.
        Ships are represented with 1s on the 8x8 Ship Board.
        Ships can be placed horizontally or vertically on the Ship Board.
        Ships are placed on the Ship Board based on x [1-8] and y [1-8] coordinates.
        Ships cannot be placed on top of eachother or placed off the 8x8 Ship Board.

        ex)
            "Player 1 places a Dingy horizontally on his/her Ship Board.
            Horizontal ships are placed from left to right, starting at the x/y coords."

                g p: 1 putH: 'Dingy' atX: 1 atY: 1
                g p: 1 show: 'Ships'

            "Player 1 places a Battleship vertically on his/her Ship Board.
            Vertical ships are placed from top to bottom, starting at the x/y coords."

                g p: 1 putV: 'Battleship' atX: 8 atY: 1
                g p: 1 show: 'Ships'

    4) Player 1 clears the screen (^L) to hide his/her Ship Board.

    5) Player 2 sets his/her Ship Board, following Step 3 above.
       Player 2 uses the "2" parameter to distinguish all of his/her own moves.

       ex)
            "Player 2 places a Cruiser horizontally on his/her Ship Board."

                g p: 2 putH: 'Cruiser' atX: 1 atY: 8
                g p: 2 show: 'Ships'

    6) Player 2 clears the screen (^L) to hide his/her Ship Board.

    7) Player 1 fires at Player 2's Ship Board.

       ex)
            "Player 1 fires and misses at position (1,1) on Player 2's Ship Board."

                g p: 1 guessX: 1 guessY: 1
       
       After each guess, the Player's 8x8 Guess Board is shown.
       
            '_' = Unknown space
             0  = Miss
             1  = Hit

       Guesses cannot be made off the 8x8 Ship Board.
       Guesses are made based on x [1-8] and y [1-8] coordinates.
       Each Player must have at least 1 ship on his/her Ship Board before guessing can begin.

       A Player may view his/her Guess Board at any time:

       ex)
            "Player 1 views his/her Guess Board"

                g p: 1 show: 'Guesses'

    8) Player 2 fires at Player 1's Ship Board.

       ex)
            "Player 2 fires and hits at position (8,1) on Player 1's Ship Board."

                g p: 2 guessX: 8 guessY: 1

    9) Players continue to take turns guessing until one player finds all of the others' ships.

    10) After one player wins, the boards are cleared and a new game begins.

        ex)
            "Start a new game by clearing each players' Ship Board and Guess Board."
            
                g newGame

    11) ^D to exit.
