@class server

    @method construct() {
        if [ $# -ne 0 ]; then
            @var dir $1
        else
            @var dir $(mktemp -d -t blank.XXXXXXXX)
        fi

        touch $dir/program
        touch $dir/listen
        touch $dir/logs
        touch $dir/pid

        mkdir -p $dir/requests/
    }

    @method get-listen() {
        @var dir
        cat "$dir/listen"
    }

    @method set-listen() {
        @var dir
        local address="$1"

        echo "$address" > "$dir/listen"
    }

    @method set-program() {
        @var dir
        local program="$1"

        echo "$program" > "$dir/program"
    }

    @method get-pid() {
        @var dir
        cat $dir/pid
    }

    @method stop() {
        @var dir

        local pid=$(cat $dir/pid)

        command kill $pid &>/dev/null
    }

    @method random-port() {
        local port=$((10000+$RANDOM))
        echo "$port"
    }

    @method start() {
        @var dir

        local program="$(cat $dir/program)"
        if [[ ! "$program" ]]; then
            program="/bin/true"
        fi

        if [[ ! -s $dir/listen ]]; then
            local port=$($this::random-port)
            echo "$(hostname):$port" > $dir/listen
        fi

        local listen=$(cat $dir/listen)

        command blankd \
            -d "$dir/requests/" \
            -l "$listen" \
            -e "$program" \
            -o "$dir/logs" > $dir/pid
    }

    @method logs() {
        @var dir
        cat "$dir/logs"
    }

    @method cleanup() {
        @var dir
        $this::stop
        rm -r $dir
    }

    @method get-dir() {
        @var dir
        echo "$dir"
    }
