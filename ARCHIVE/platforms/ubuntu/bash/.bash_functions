branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} "}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0) print "# "}'
}
