use Date::Parse;

$date='19 Nov 2005 03:18:55 -0500';
($sec,$min,$hr,$day,$month,$year,$zone)=strptime($date);
print "seconds=" . $sec . "\n" . "minutes=" . $min . "\n" . "hours=" . $hr . 
   "\n" . "day=" . $day . "\n" . "month=" . $month. "\n" . "year=" . 
   $year . "\n" ."zone=" . $zone;
