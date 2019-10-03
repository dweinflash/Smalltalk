"Ship.st"
Object subclass: Ship [
    | size |
    <comment: 'I represent a ship game piece'>

    Ship class >> new [
        | r |
        <category: 'instance creation'>
        r := super new.
        r init.
        ^r
    ]

    init [
        <category: 'initialization'>
    ]

    printOn: stream [
        <category: 'printing'>
        super printOn: stream.
        stream nextPutAll: ' of size: '.
        size printOn: stream
    ]

    placeV: board atX: x atY: y [
        <category: 'Place the ship vertically on the board,
                    from top to bottom, starting at x y.
                    Return true if successful, false if not.'>

        | lastY |

        "Return false if x coord off board"
        (x < 1) | (x > 8) ifTrue: [^false].

        "Return false if first y coord off board"
        (y < 1) | (y > 8) ifTrue: [^false].

        "Return false if last y coord off board"
        lastY := y + (size-1).
        (lastY > 8) ifTrue: [^false].

        "Return false if ship stacks on top of another ship"
        y to: lastY
        do: [:index | (board emptyX: x emptyY: index) ifFalse: [^false]].  

        "Place ship on board"
        y to: lastY
        do: [:index | (board placeX: x placeY: index)]. 

        ^true  
    ]

    placeH: board atX: x atY: y [
        <category: 'Place the ship horizontally on the board,
                    from left to right, starting at x y.
                    Return true if successful, false if not.'>

        | lastX |

        "Return false if y coord off board"
        (y < 1) | (y > 8) ifTrue: [^false].

        "Return false if first x coord off board"
        (x < 1) | (x > 8) ifTrue: [^false].

        "Return false if last x coord off board"
        lastX := x + (size-1).
        (lastX > 8) ifTrue: [^false].

        "Return false if ship stacks on top of another ship"
        x to: lastX
        do: [:index | (board emptyX: index emptyY: y) ifFalse: [^false]].  

        "Place ship on board"
        x to: lastX
        do: [:index | (board placeX: index placeY: y)]. 

        ^true  
    ]


]
