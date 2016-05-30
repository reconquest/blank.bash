tests:clone server.class.bash .
tests:clone request.class.bash .
tests:clone vendor .
tests:clone tests/program bin/

tests:involve blank.bash

:cleanup() {
    local server="$1"
    tests:describe "server logs:"
    tests:eval $server::logs
    tests:describe "terminating server"
    tests:eval $server::cleanup
}
