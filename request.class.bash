@class request
    @method construct() {
        @var dir "$1"
    }

    @method get-id() {
        @var dir
        cat "$dir/_id"
    }

    @method get() {
        @var dir
        cat "$dir/raw"
    }

    @method get-method() {
        @var dir
        cat "$dir/method"
    }

    @method get-host() {
        @var dir
        cat "$dir/host"
    }

    @method get-uri() {
        @var dir
        cat "$dir/uri/raw"
    }

    @method get-uri-path() {
        @var dir
        cat "$dir/uri/path"
    }

    @method get-uri-query() {
        @var dir
        cat "$dir/uri/query"
    }

    @method get-uri-values() {
        @var dir
        cat "$dir/uri/values"
    }

    @method get-headers() {
        @var dir
        cat "$dir/headers/raw"
    }

    @method get-headers-values() {
        @var dir
        cat "$dir/headers/values"
    }

    @method get-cookies() {
        @var dir
        cat "$dir/cookies"
    }

    @method get-body() {
        @var dir
        cat "$dir/body/raw"
    }

    @method get-body-values() {
        @var dir
        cat "$dir/body/values"
    }
