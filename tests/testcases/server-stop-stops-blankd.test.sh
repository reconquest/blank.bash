blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::start
tests:ensure $server::get-pid
tests:assert-stdout-re '^[0-9]+$'
tests:ensure $server::stop
tests:not tests:ensure ps -p $($server::get-pid)
