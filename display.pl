initialBoard([
                       [empty,empty,empty,empty,empty],
                     [empty,empty,empty,empty,empty,empty],
                   [empty,empty,empty,empty,empty,empty,empty],
                 [empty,empty,empty,empty,empty,empty,empty,empty],
               [empty,empty,empty,empty,empty,empty,empty,empty,empty],
                 [empty,empty,empty,empty,empty,empty,empty,empty],
                   [empty,empty,empty,empty,empty,empty,empty],
                     [empty,empty,empty,empty,empty,empty],
                       [empty,empty,empty,empty,empty]
]).

symbol(empty,S) :- S='.'.
symbol(black,S) :- S='X'.
symbol(white,S) :- S='O'.