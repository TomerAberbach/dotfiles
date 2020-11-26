function clamp -a min number max
  if test $number -lt $min
    echo $min
  else if test $number -gt $max
    echo $max
  else
    echo $number
  end
end
