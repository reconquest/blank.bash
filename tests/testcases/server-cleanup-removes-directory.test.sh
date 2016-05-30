blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::start
tests:ensure $server::logs
tests:ensure $server::cleanup
tests:not tests:ensure $server::logs
tests:not tests:ensure $server::get-pid
