Rules:
------
0:     $start -> Sentence $end
1:     Sentence -> List
2:     Sentence -> List 'and' Item
3:     List -> Item ',' List
4:     List -> Item
5:     Item -> 'bread'
6:     Item -> 'milk'
7:     Item -> 'eggs'
8:     Item -> 'meat'

States:
-------
State 0:

       $start -> . Sentence $end   (Rule 0)

       'bread'shift, and go to state 5
       'eggs' shift, and go to state 4
       'meat' shift, and go to state 6
       'milk' shift, and go to state 2

       List   go to state 1
       Item   go to state 3
       Sentence      go to state 7

State 1:

       Sentence -> List .   (Rule 1)
       Sentence -> List . 'and' Item      (Rule 2)

       'and'  shift, and go to state 8

       $default      reduce using rule 1 (Sentence)

State 2:

       Item -> 'milk' .     (Rule 6)

       $default      reduce using rule 6 (Item)

State 3:

       List -> Item . ',' List     (Rule 3)
       List -> Item .	(Rule 4)

       ','    shift, and go to state 9

       $default      reduce using rule 4 (List)

State 4:

       Item -> 'eggs' .     (Rule 7)

       $default      reduce using rule 7 (Item)

State 5:

       Item -> 'bread' .    (Rule 5)

       $default      reduce using rule 5 (Item)

State 6:

       Item -> 'meat' .     (Rule 8)

       $default      reduce using rule 8 (Item)

State 7:

       $start -> Sentence . $end   (Rule 0)

       $end   shift, and go to state 10

State 8:

       Sentence -> List 'and' . Item      (Rule 2)

       'bread'shift, and go to state 5
       'eggs' shift, and go to state 4
       'meat' shift, and go to state 6
       'milk' shift, and go to state 2

       Item   go to state 11

State 9:

       List -> Item ',' . List     (Rule 3)

       'bread'shift, and go to state 5
       'eggs' shift, and go to state 4
       'meat' shift, and go to state 6
       'milk' shift, and go to state 2

       List   go to state 12
       Item   go to state 3

State 10:

       $start -> Sentence $end .   (Rule 0)

       $default      accept

State 11:

       Sentence -> List 'and' Item .      (Rule 2)

       $default      reduce using rule 2 (Sentence)

State 12:

       List -> Item ',' List .     (Rule 3)

       $default      reduce using rule 3 (List)


Summary:
--------
Number of rules         : 9
Number of terminals     : 7
Number of non-terminals : 4
Number of states        : 13
