use strict;
use warnings;
#use Switch;

use lib 'C:\Users\Win\Desktop\Perl Mini Project\ExpenseTracker';

use Expense;

#$\ = "\n";

my @exp_list = ();

sub add_exp {
    print 'Enter the amount : ';
    my $am = <STDIN>;
    chomp $am;
    
    print 'Enter the purpose of expense : ';
    my $pu = <STDIN>;
    chomp $pu;
    
    print 'Enter the month : ';
    my $mo = <STDIN>;
    chomp $mo;
    
    my $object = new Expense($am , $pu, lc($mo));
    #@exp_list = unshift $object;
    my $value = @exp_list;
    if ($value < 1) {
        #code
        @exp_list[0] = $object;
    } else {
        ##@exp_list = unshift $objec#t;
        push (@exp_list , $object);
    }
    
    #@exp_list[0] = $object;
    
    $object->display();
    
}

sub list_my_expenses {
    my $count = 1;
    foreach my $temp (@exp_list) {
        print "\n$count : " ;
        $temp->display();
        $count++;
    }
}

sub del_exp {
    print "\nList of Expenses";
    list_my_expenses();
    
    print "\nEnter the serial number of expense to be deleted : ";
    my $sn = <STDIN>;
    chomp $sn;
    
    splice @exp_list,$sn-1 , $sn-1;
    list_my_expenses();
    #print "@exp_list";
}

sub monthly_expenses{
    my %exp;
    
    my $count = 1;
    foreach my $temp (@exp_list) {
        
        my $month = $temp->getMonth();
        my $amount = $temp->getAmount();
        
        if (exists $exp{$month}) {
            $exp{$month} = $exp{$month} + $amount;
        } else {
            $exp{$month} = $amount;
        }
        
        $count++;
    }
    #print %exp;
    foreach my $key (keys %exp) {
        print "$key -> $exp{$key}";
        print "\n";
    }
}

#add_exp();
#add_exp();
#add_exp();
#
#list_exp();

my $flag = 1;

while($flag) {
    print "\n\nPress 1 to add new expense\nPress 2 to delete existing expense\nPress 3 to view expenses\nPress 4 to analyse monthly expenses\nPress 0 to exit\n";
    my $flag = <STDIN>;
    chomp $flag;
    
    if ($flag == 0) {
        #code
        last;
    } elsif ($flag == 1) {
        add_exp();
    } elsif ($flag == 2) {
        del_exp();
    } elsif ($flag == 3) {
        list_my_expenses();
    } elsif ($flag == 4) {
        monthly_expenses();
    } else {
        print "\nInvalid Input!!!";
        continue;
    }
}

