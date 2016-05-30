__blank_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source $__blank_dir/vendor/github.com/reconquest/import.bash/import.bash

import github.com/reconquest/classes.bash


# @description Create instance of blankd server.
#
# @arg $1 string Variable name for object of class.
blank:server:new() {
    classes:require $__blank_dir/server.class.bash
    classes:new server "$@"
}

# @description Create instance of request to blankd server.
#
# @arg $1 string Variable name for object of class.
blank:request:new() {
    classes:require $__blank_dir/request.class.bash
    classes:new request "$@"
}
