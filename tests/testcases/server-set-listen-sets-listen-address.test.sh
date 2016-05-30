blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::set-listen $(hostname):12354
tests:ensure $server::start
tests:ensure ps -fp $($server::get-pid)
tests:assert-stdout ':12354'
