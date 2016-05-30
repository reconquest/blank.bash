blank:server:new server
trap ":cleanup $server" EXIT

tests:ensure $server::set-program program
tests:ensure $server::start

tests:ensure \
    curl -d 'post=2' -b 'cookie=1' -X PUT -vs $($server::get-listen)/a/b?x=y

blank:request:new request $(cat request_dir)
tests:ensure $request::get-id
tests:assert-stdout-re '^[0-9a-z]{32}$'
