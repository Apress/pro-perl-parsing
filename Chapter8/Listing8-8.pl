use Date::Parse;

$date='19 Nov 2005 03:18:55 -0500';
$unixtime=str2time($date);
print $unixtime;
