# Shell Scripting Learning
## 1. Intruduction
Linux operation system needed
#### What is shell?
Unix shell program interprets (not compile) user commands which are either directly entered by the user or which can be read from a file called the shell script or shell program.

#### bash shell scripting 
￥￥ctrl+alt+T￥￥: open terminal
serach shell types: cat /etc/shells
bash-bourne-again shell
know where bash are located: which bash
clear screen: clear

##### hello.sh for shell's hello world
touch hello.sh: create file
ls -al: check the files' state

\#! /usr/bin/bash (the location of bash):  help the interpreter to know that this is a bash shell
echo "Hello world"
echo: use to print 

./hello.sh in the terminal
**problem**: when using touch to create a file, it has only read and write permission but not execute permission
chmod +x hello.sh: change the permission, add x
## 2. Variables and Comments
#### comment
\# + word: will not be executed
#### Variables
two types of variables in Unix:
1. System variables: predefined
    \$BASH: name of bash
    \$BASH_VERSION
    \$HOME
    \$PWD
2. user defined variables
    can be defined and used with $
    variable name should not start with a number

## 3. Read User Input 
read + variable name
the variable after read comment can be more than 1, space between them is needed

read -p "words" variable name: input on the same line with word

read -sp "words" variable name: silent input

echo with no word behind: \n 

read -a: read a array
when print a array, ${variable[ ]} needed

read with no variable after:  built-in variable

## 4. Pass Arguments to a Bash-Script
pass arguments into a bash-script when writing script
echo \$1 \$2 ...
special for \$0

pass argument into array:
args=("\$@")
echo \${args[0]} \${args[1]} \${args[2]}
or:
echo \$@: print all argument

echo \$#: print the number of argument

## 5. If Statement
```sh
if [ condition 1 ]
then
    statement 1
elif [condition 2 ]
then
    statement 2
else
    statement 3
fi
```
- integer comparsion
    [\$variable -eq 10]
or: ((\$variable = 10))
- string comparsion
    for = == != : [\$variable = "b"]
    for < > -z: \[[\$variable < "v"]]

## 6. File test operators
Most of the time using shell script: dealing with files
echo -e "\c": keep the cursor on the same line after the end of the echo

if [ -e $file_name ]: check file exist or not
other flag:
    -f: regular file or not
    -d: directory name exist or not
    -b: 
    -c:
    -s: empty or not
    -r: check read permission 
    -w: check write permission

two types of files:
character special file
block special file

cat > filename: write something into a file, use ctrl+D to exit

## 7. How to append output to the end of text file
cat >>: append
cat>: overwrite

chmod -w remove permission

## 8. Logical 'AND' Operator
1. [ condition 1 ] && [ condition 2 ]
2. [ condition 1 -a condition 2 ]
3. \[[ condition 1 &&  condition 2 ]]

cat file 1 > file 2: write content of file 1 into file 2
## 9. Logical 'AND' Operator
1. ||
2. [ -o ]
3. \[[  ||  ]]

## 10. Perform Arithmetic operations
Need to base on variables
```sh
num1=1
num2=2
echo $(( num1 + num2 ))
```
If use expr:
```sh
echo $( expr $num1 + $num2)
```
(when using *, \\\* is need)
also can do the arithmetic operations

## 11.  Floating point math operations in bash
The operations in 10 do not support decimal number on thematic operations.

Problem:
- expr: non-integer argument
Special tool:
**BC**: basic calculator
echo "20.5+5" | bc: take the left as a input to the right

for division: scale is needed to be set:
```sh
echo "scale=2;20.5/5" | bc
```
bc can do much of things. (like sqrt)
bc -l: calling the math library for bc to calculate square root function

man bc: for help of bc

## 12. The case statement
```sh
case expression in
    pattern1 )
        statements 2  ;;
    pattern2 )
        statements 2 ;;
    ...
esac
```

## 13. The case statement Example
echo -e " \c"
```sh
#! /usr/bin/bash

echo -e "Enter some character: \c"
read value

case $value in
        [a-z] )
                echo "a-z" ;;
        [A-Z] )
                echo "A-Z" ;;
        [1-9] )
                echo "1-9" ;;
        ? ) # other one character
                echo "special character" ;;
        * ) # more than one other character
                echo "Unknow input" ;;
esac
```
(LANG=C somethimes)

#### 14. Array variables
```sh
os=('ubuntu' 'windows' 'kali')
os[3]='mac'     # add elements to the array
os[0]='OS' # update the array
echo "${os[@]}" # print all elements
echo "${os[1]}" # print the second element
echo "${!os[@]}" # print the indexes of the array
echo "${#os[@]}" #print the length of the array
unset os[2]    # remove element in array
echo "${os[@]}"
os[6]='crea' # out of range, position is igonred
echo "${#os[@]}"
echo "${os[@]}"

string=dasdasasdasd # take string as array
echo "${string[@]}"
echo "${#string[@]}" # only one element in the array
```
output:
OS windows kali mac
windows
0 1 2 3
4
OS windows mac
4
OS windows mac crea
dasdasasdasd
1

#### 15. WHILE loops
```sh
while [ condition ]
do
    command 1 # what we want to do
    command 2 # change the condition
done
```
n =$(( n+1 )): n+=1 in shell
or (( n++ ))  (( ++n ))
#### 16. Using sleep and open terminal with WHILE Loops
sleep: give a pause
press ctrl+c in terminal to go out of a running script
```sh
n=1

while [ $n -le 3 ]
do
		echo "$n"
		(( n++ ))
		gnome-terminal &  # open a new terminal
		sleep 1
done
```
#### 17. Read a file content in Bash
three way of reading file using while:
1. input read direction: <
```sh
while read p
do
	echo $p
done < useOr.sh
```
read the usrOr.sh content into the while loop p and then print p

2. read the file in a single variable by using a pipe symbol: |
```sh
cat hello.sh | while read p
do
	echo $p
done
```
3. IFS
```sh
while IFS= read -r line # space is important, assign a space to IFS
do 
	echo $line
done < /etc/hosts
```

#### 18. UNTIL loop
```sh
until [ condition ]
do 
    command 1
    command 2
    command 3
done
```
run the command until reach the condition

#### 19. FOR loop
The for loop have several syntaxes:
```sh
for val in 1 2 3 4 ... N
do
    command
done
# OR------------------------
for val in {1..N..2} # 1 to N including N incremented by 2
do
    command
done
# OR------------------------
for val in file1 file2 file3
do
    command on $val
    command
    command
done
# OR------------------------
for OUTPUT in $( Linux or Unix command)
do
    command on $OUTPUT
    command
    command
done
# OR------------------------
for (( EXP1; EXP2; EXP3 ))
do
    command
done
```
$BASH_VERSION to see the bash verision
#### 20. use FOR loop to execute commands
```sh
for command in ls pwd date
do
	echo "-------$command---------"
	$command
done
```
```sh
for item in *
do
	if [ -d item ]
	then
		echo $item
	fi
done
```
Some problems exist in the second code.

#### 21. Select loop
```sh
select val in list
do
    command
    case ....
    esacn 
done
```
for example:
```sh
select $name in mark john tom ben
do
    case $name in
    mark)
        echo mark selected
        ;;
    john)
        echo john selected
        ;;
    tom)
        echo tom selected
        ;;
    ben)
        echo ben selected
        ;;
    *)
        echo "Error please provide the no."
    esac
done
```

#### 22. Break and continue
break: break the loop
continue: directly continue to the next loop

#### 23. Functions
function: cod block for some operations
Two kinds of syntaxes:
```sh
function name(){
    commands
}

name(){
    commands
}

function print(){   #function with argument
	echo $1 $2 $3
}
```

#### 24. Local variables
 All variables declared without a local  are global variables, nomatter in or outside a function.

Can use a **local** command to define a local variables. Can not be accessed outside the function.

#### 25. Function Example
```sh
function usage(){
	echo "You need to provide an argument: "
	echo "usage: $)file_name"
}


function is_file_exist(){
	local file="$1"   #$1 means the first argument provided for the function
	[[ -f "$file" ]] && return 0 || return 1  # ternary operation
}

[[ $# -eq 0 ]] && usage # check whether a argument is provided

if(is_file_exist "$1") # here $1 means the first argument provided for the scrpit
then
	echo "file found"
else
	echo "not found"
fi
```
- -f: check a file is really file or not
- ternary operation： \[[ condition ]] && command 1 || command 2, if condition can be reached, command 1 will be jumped

#### 26. Readonly command
Used for variables and functions and make them read-only so they can not be overwritten.
```sh
readonly var=31
# or: readonly var
var=50
echo "var => $var"

function hello(){
	echo "Hello world"
} 
hello
readonly -f hello # -f for function

function hello(){
	echo "Hello world again"
} 

readonly
```
Use **readonly** command individ can see the readonly variables. -f for see readonly functions, -p for variables.

#### 27. Signals and Traps
```sh
trap "echo Exit signal is detected" SIGINT # or value, detect the ctrl+c signal
trap "echo Exit Signal is detected" SIGKILL # will not work
echo "pid is $$"
while (( COUNT < 10 ))
do
	sleep 10
	(( COUNT++ ))
	echo $COUNT
done
exit 0
```
```sh
trap "echo Exit command is detected" 0 # execite the command when receive the signal 0 
echo "Hello World"
exit 0
```
```sh
touch file.txt
file=/home/Desktop/file.txt
trap "rm -f $file && echo file deleted; exit" 0 2 15 # catch several signal
```
- echo $$ to print the pid of the script it self
- ctrl + C to exit (interrupt signals) (SIGINT)
- ctrl + Z: suspend signal (SIGTSTP)
- kill -9 pid: kill the running process (sig kill signal)
- man 7 signal: to see more explanation
- success signal 

Using **trap** command can catch this kinds of signal and then can do something before exiting out.

Trap can not catch sigkill command and sigstop command.

Every signal has its value.

Use trap in prompt to see the list of traps.
- trap - signal value: to remove trap

#### 28. How to debug a bash script
- bash -x ./file.sh: see how the script run by giving step by step
- #! /usr/bin/bash -x: -x at the top of the .sh file
- set -x     set +x: at the .sh file to set the debugging range


## Special Stuff
#### 1. Link with Linux through SSH
1. 
- From Windows
Install PuTTY on your Windows
- From iphone
Install the ssh app

2. Install openSSH on linux (on ubuntu):
```sh
$ sudo apt-get install openssh-server
```
3. Use **ifconfig** command to find the IP of your Linux
Use:
```sh
$ sudo get install net-tools
```
to install the ifconfig command.

4. Take your Linux IP in inet addr into the **Host name**/**IP address** of your PuTTY/mobile app.

#### 2. Run your code on the Linux

#### 3. File transfer

#### 4. Build sharing folder
1. Create a Shard folder on your Home direction:
```sh
mkdir ~/Shared/
```

2. Right click and press **Local Network Share** to create Share

3. Set a password for sharing files
in the terminal:
```sh
sudo smbpasswd -a your_user_name
```
#### 5. File Permissions on linux


## Reference:
> https://www.youtube.com/watch?v=cQepf9fY6cE&list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_

> http://www.dba-oracle.com/linux/file_directory_security.htm

> https://morvanzhou.github.io/ 