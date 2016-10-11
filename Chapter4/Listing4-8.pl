%left   '+' '-'
%left   '*' '/'

%%
sentence:     expression;
expression:   addition|subtraction|multiplication|division;
addition:     number '+' number {$_[1]+$_[3]};
subtraction:  number '-' number {$_[1]-$_[3]};
multiplication:      number '*' number {$_[1]*$_[3]};
division:     number '/' number {if($_[3]==0)
                  {print "Division by Zero";}else{$_[1]/$_[3];}};
%%
