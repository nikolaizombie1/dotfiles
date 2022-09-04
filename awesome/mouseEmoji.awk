/model/ {$1=""; model=$0}
/percentage/ {percentage=$2}

{
    if (model ~/Master/ && percentage != "") {
        print percentage;
        exit 0;
    }
}
