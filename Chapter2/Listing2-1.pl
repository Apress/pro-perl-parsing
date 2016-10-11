#!/usr/bin/perl	

my @rules;
my $SententialForm;
my @rhs;

# read in grammar rules file
while(<>){
    push @rules, [split/::= /];
}

#Sets sentential form equal to <Sentence>
$SententialForm=$rules[0][0];

#While checks for remaining non-terminals
while($SententialForm=~/<\w*>/) {
    $NonTerm=$&;

    #Loops through rules to find non-terminal matches
    foreach $rule (@rules){
        $lhs = $rule->[0];
        $rhs = $rule->[1];
        if($NonTerm=~/$lhs/){
            #If rule matches sets, non-terminal equal to rule rhs
            if($rhs!~/\|/){
                $SententialForm=~s/$NonTerm/$rhs/;
            }
            #If rule has more than one rhs picks one at random
            elsif($rhs=~/\|/){
                # @rhs is an array made of the alternate elements of $rhs
                @rhs=split /\|/, $rhs;
                
            # replace $NonTerm with a random element of @rhs
                $SententialForm=~s/$NonTerm/$rhs[int(rand(@rhs))]/; 
            }
        }
    }
}

#When no non-terminals are remaining prints generated sentence
print $SententialForm;
