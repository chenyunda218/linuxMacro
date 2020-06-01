mc(){
    case $# in
        1) 
        case $1 in
            -l) listMacros ;;
            *) macros $1 ;;
            deleteAll) deleteAllMacros ;;
        esac
        ;;
        *)
            case $1 in
                -n)
                    newMacro $2 "${@:3}"
                ;;
                -d)
                    deleteMacro $2
                ;;
            esac
        ;;
    esac
}

macrosPath=~/.linuxMacro/macros.sh

listMacros(){
    sed -n "/.*).*;;/p" $macrosPath
}

deleteMacro(){
    sed -i -r "/^$1\).*;;/d" $macrosPath
    source $macrosPath
}

deleteAllMacros(){
    sed -i "/.*;;/d" $macrosPath
}

newMacro(){
    deleteMacro $1
    re="2a$1\) ${@:2} ;;"
    sed -i "$re" $macrosPath
    source $macrosPath
}