blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::start
tests:ensure $server::get-pid
tests:assert-stdout-re '^[0-9]+$'
tests:ensure ps -p $(cat $(tests:get-stdout-file))
