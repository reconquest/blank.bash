blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::start
tests:ensure $server::logs
tests:assert-stdout-re 'master'
tests:assert-stdout-re 'fork'
