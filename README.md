# linuxMacro
This is a macro to manage macros.  
Only accept single line command. For example cd to somewhere.

mc -n for new macro
```
$ mc -n hello echo "hello world"
$ mc hello
hello world
```
mc -l for list macro
```
$ mc -l
hello) echo hello world ;;
```
mc -d for delete macro
```
mc -d hello
```
