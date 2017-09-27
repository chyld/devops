branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "-" $2 "- "}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0) print "# "}'
}

dirty()
{
  git branch -v 2> /dev/null | awk '{if($1 == "*") print $0}' | branch-sync
}

dirsize()
{
  ls -al | wc | awk '{print $1 - 3}'
}
