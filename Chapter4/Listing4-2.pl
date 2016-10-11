sub Lexer{
    my($parser)=shift;

    #Checks to see if data to be parsed is present
    $parser->YYData->{INPUT} or return('',undef);

    $parser->YYData->{INPUT}=~s/^[ \t]//;

    #Returns tokens to parser
    for($parser->YYData->{INPUT}){
        s/^(bread)// and return ('bread', $1);
        s/^(milk)// and return ('milk', $1);
        s/^(eggs)// and return ('eggs', $1);
        s/^(meat)// and return ('meat', $1);
        s/^(,)// and return (',',$1);
        s/^(and)// and return ('and',$1);
    }
}
