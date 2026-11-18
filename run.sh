
#!/bin/bash

# Usage: ./run.sh -n REQUESTS -c CONCURRENCY [-r ROUNDS] [-i] URL

REQUESTS=""
CONCURRENCY=""
ROUNDS="0"
IS_IOS=false
LOCATION_PID=""

cleanup() {
    echo ""
    echo "Stopping benchmark..."

    if [[ -n "$LOCATION_PID" ]]; then
        kill "$LOCATION_PID" 2>/dev/null
        wait "$LOCATION_PID" 2>/dev/null
    fi

    echo "All tests stopped."
    exit 130
}

trap cleanup INT TERM

while getopts ":n:c:r:i" opt; do
    case "$opt" in
        n) REQUESTS="$OPTARG" ;;
        c) CONCURRENCY="$OPTARG" ;;
        r) ROUNDS="$OPTARG" ;;
        i) IS_IOS=true ;;
        *)
            echo "Invalid option"
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))
URL="$1"

echo "REQUESTS: $REQUESTS"
echo "CONCURRENCY: $CONCURRENCY"
echo "ROUNDS: $ROUNDS"
echo "IS_IOS: $IS_IOS"
echo "URL: [$URL]"

if [[ -z "$REQUESTS" || -z "$CONCURRENCY" || -z "$URL" ]]; then
    echo "Usage: $0 -n REQUESTS -c CONCURRENCY [-r ROUNDS] [-i] URL"
    exit 1
fi

if ! command -v ab &>/dev/null; then
    echo "Error: Apache Bench (ab) is not installed."
    exit 1
fi

if $IS_IOS; then
    echo "Accessing position"
    cat /dev/location > /dev/null &
    LOCATION_PID=$!
fi

RUN=1

while [[ "$ROUNDS" -eq 0 || "$RUN" -le "$ROUNDS" ]]; do
    echo "========================================"
    echo "Run $RUN"
    echo "URL: $URL"
    echo "Requests: $REQUESTS"
    echo "Concurrency: $CONCURRENCY"
    echo "========================================"

    ab -n "$REQUESTS" -c "$CONCURRENCY" "$URL"

    echo "Finished run $RUN"
    ((RUN++))
done

echo "All tests completed."
exit 0
