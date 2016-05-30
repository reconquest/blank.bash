blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::set-program super-program
tests:ensure $server::start
tests:ensure ps -fp $($server::get-pid)
tests:assert-stdout-re '-e super-program'
