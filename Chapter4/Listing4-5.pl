####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package MyGrammar;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
       {#State 0
             ACTIONS => {
                     "milk" => 2,
                     "bread" => 5,
                     "eggs" => 4,
                     "meat" => 6
             },
             GOTOS => {
                     'List' => 1,
                     'Item' => 3,
                     'Sentence' => 7
             }
       },
       {#State 1
              ACTIONS => {
                     "and" => 8
              },
              DEFAULT => -1
       },
       {#State 2
              DEFAULT => -6
       },
       {#State 3
              ACTIONS => {
                     "," => 9
              },
              DEFAULT => -4
       },
       {#State 4
              DEFAULT => -7
       },
       {#State 5
              DEFAULT => -5
       },
       {#State 6
              DEFAULT => -8
       },
       {#State 7
              ACTIONS => {
                     '' => 10
              }
       },
       {#State 8
              ACTIONS => {
                     "milk" => 2,
                     "bread" => 5,
                     "eggs" => 4,
                     "meat" => 6
              },
              GOTOS => {
                     'Item' => 11
              }
       },
       {#State 9
              ACTIONS => {
                     "milk" => 2,
                     "bread" => 5,
                     "eggs" => 4,
                     "meat" => 6
              },
              GOTOS => {
                     'List' => 12,
                     'Item' => 3
              }
       },
       {#State 10
              DEFAULT => 0
       },
       {#State 11
              DEFAULT => -2
       },
       {#State 12
              DEFAULT => -3
       }
],
                                  yyrules  =>
[
       [#Rule 0
               '$start', 2, undef
       ],
       [#Rule 1
               'Sentence', 1, undef
       ],
       [#Rule 2
               'Sentence', 3, undef
       ],
       [#Rule 3
               'List', 3, undef
       ],
       [#Rule 4
               'List', 1, undef
       ],
       [#Rule 5
               'Item', 1, undef
       ],
       [#Rule 6
               'Item', 1, undef
       ],
       [#Rule 7
               'Item', 1, undef
       ],
       [#Rule 8
               'Item', 1, undef
       ]
],
                                  @_);
    bless($self,$class);
}

#line 7 "MyGrammar.yp"


sub Lexer{
    my($parser)=shift;
    
    $parser->YYData->{INPUT} or return('',undef);
    $parser->YYData->{INPUT}=~s/^[ \t]//;
    for($parser->YYData->{INPUT}){
        s/^(bread)// and return ('bread', $1);
        s/^(milk)// and return ('milk', $1);
        s/^(eggs)// and return ('eggs', $1);
        s/^(meat)// and return ('meat', $1);
        s/^(,)// and return (',',$1);
        s/^(and)// and return ('and',$1);
    }
}


sub Error {
    exists $_[0]->YYData->{ERRMSG}
    and do {
        print $_[0]->YYData->{ERRMSG};
        delete $_[0]->YYData->{ERRMSG};
        return;
   };
    print "Syntax error\n";
}

sub parse{
  my ($self, $input) = @_;
  $self->YYData->{INPUT} = $input;
  my $result = $self->YYParse(yylex => \&Lexer, yyerror => \&Error, yydebug=>0x1F);
  return $result;
}
1;
