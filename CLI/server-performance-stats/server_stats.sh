echo "######################"
echo "# System Uptime Info #"
echo "######################"

uptime

echo

echo "###################"
echo "# Total CPU Usage #"
echo "###################"

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo "###################"
echo "# Total memory usage (Free vs Used including percentage) #"
echo "###################"

free -m | awk 'NR==2 {used=$3; avail=$7; total=$2; printf "Total: %d MB\nUsed: %d MB (%.2f%%)\nAvailable: %d MB (%.2f%%)\n", $2, used, used/total*100, avail, avail/total*100}'

echo "###################"
echo "# Total disk usage (Free vs Used including percentage) #"
echo "###################"


df -h / | awk 'NR==2 {used=$3; free=$4; pct=$5; total=$2; printf "Used: %s (%s)\nFree: %s\nTotal: %s\n", used, pct, free, total}'

echo "###################"
echo "# Top 5 processes by CPU usage#"
echo "###################"


ps aux --sort=-%cpu | awk 'NR<=6 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'

echo "###################"
echo "# Top 5 processes by memory usage#"
echo "###################"


ps aux --sort=-%mem | awk 'NR<=6 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
