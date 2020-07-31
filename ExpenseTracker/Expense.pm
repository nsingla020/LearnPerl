package Expense;
sub new {
    my $class = shift;
    my $self = {
      _amount => shift,
      _purpose => shift,
      _month => shift,
   };
  
   bless $self, $class;
   return $self;
}

sub setAmount {
   my ( $self, $amount ) = @_;
   $self->{_amount} = $amount if defined($amount);
   return $self->{_amount};
}

sub getAmount {
   my( $self ) = @_;
   return int($self->{_amount});
}

sub getAmountStr {
   my( $self ) = @_;
   return $self->{_amount};
}

sub setPurpose {
   my ( $self, $purpose ) = @_;
   $self->{_purpose} = $purpose if defined($purpose);
   return $self->{_purpose};
}

sub getPurpose {
   my( $self ) = @_;
   return $self->{_purpose};
}

sub getMonth {
   my( $self ) = @_;
   return $self->{_month};
}

sub display {
   my( $self ) = @_;
   print "Amount: $self->{_amount} - Purpose: $self->{_purpose} in $self->{_month} month";
}

1;
