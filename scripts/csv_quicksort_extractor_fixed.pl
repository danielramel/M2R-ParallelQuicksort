use strict;

my($line);
my($size);
my($seq,$par,$libc);
print "Size, Seq, Par, Libc\n" ;
while($line=<>) {
    chomp $line;
    # Remove any potential carriage returns
    $line =~ s/\r//g;
    
    if($line =~/^Size: (\d+(?:\.\d+)?)$/) {
        $size = $1;
        next;
    } 
    if($line =~/^Sequential quicksort took: (\d+(?:\.\d+)?) sec\.$/) {
        $seq=$1; next;
    } 
    if($line =~/^Parallel quicksort took: (\d+(?:\.\d+)?) sec\.$/) {
        $par=$1; next;
    } 
    if($line =~/^Built-in quicksort took: (\d+(?:\.\d+)?) sec\.$/) {
        $libc=$1; 
        print "$size, $seq, $par, $libc\n";
        # Reset variables for next set
        $size = $seq = $par = $libc = "";
        next;
    }
}