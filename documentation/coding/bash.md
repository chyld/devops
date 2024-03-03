# bash.md

## variables

```bash
var1="$abc"
var2="${var1}_part2"
```

- creating variables
- no space between variable and value
- use double quotes around variables
- use `${var}` when you want to string concatenation

```bash
var1="hello"
export var2="world"
```

- a shell variable
- an environment variable

## arguments

```bash
$0, $1, $2, $@
```

- arguments, with `$0` being the filenaem
- `$@` is an array of all arguments minus `$0`

## quotes

```bash
' vs "
```

- single quotes will not expand
- double quotes will expand

## braces

```bash
{ ls; pwd; ps }
```

- grouping commands
- runs in **current process**
- does not capture output
- **needs space** at beginning and end

```bash
(ls; pwd; ps)
```

- grouping commands
- runs in a **subshell**
- does not capture output
- no extra space needed

```bash
var=$(ls;pwd;uname -a;cat doc.txt)
```

- runs commands in a **subshell**
- **captures** output from **all** commands into variable

```bash
file.{txt,svg,png}
```

- brace expansion
- becomes `file.txt`, `file.svg` and `file.png`

```bash
${#var}
```

- get the length of var

```bash
${string//search/replace}
${dogcathorse//dog/pup}
```

- search and replace parts of a string

```bash
${var:-$var2}
```

- default value for var if it does not exist

```bash
${var#pattern}
${var%pattern}
```

- remove the prefix/suffix pattern from var

```bash
${var:offset:length}
```

- get a substring of var

```bash
var=(1 2 3)
```

- create an **array**
- able to loop over

## redirects

```bash
echo "hello" 1> out.txt
echo "world" 2> err.txt
echo "junk" 1> /dev/null 2>&1
```

- send to stdout
- send to stderr
- send to stdout and set stderr same as stdout

## if statements

```bash
if CMD; then
    # do stuff
fi

[...] and [[...]] can also used
```

## loops

```bash
for name in Alice Bob Charlie; do
  echo "Hello, $name!"
done
```

- looping over words

```bash
for i in {1..5}; do
  echo "Number $i"
done
```

- looping over a range of numbers

```bash
fruits=("Apple" "Banana" "Cherry")
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done
```

- looping over an array

## functions

```bash
my_func() {
    local var1
    var1="$1"
    return 0
}
```

- the function definition
- use `local` to declare variables
- assign variable should be separate from declaration
- return 0 is success, greater than 1 is failure

## globs

```bash
*
?
[abc]
```

- bash expands globs to match filenames
- matches 0 or more characters
- matches 1 character
- matches either `a`, `b` or `c`

## traps

`trap COMMAND EVENT`

- trap will listen for an event and then trigger the command
- useful for resource cleanup

## errors

`set -e` stops the script on errors
`set -u` stops the script if you try to use an unset variable
`set -o pipefail` stops the script if any command in a pipeline fails
`set -euo pipefail` puts them all together

## debugging

```bash
set -x
```

- put at top of bash script
- great for debugging

```bash
shellcheck script.sh
```

- checks for syntax errors

## miscellaneous

```bash
bash script.sh
source script.sh
```

- `bash` runs the script in a subshell
- `source` runs the script in the current process

## end of guide

