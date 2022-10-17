#!/usr/bin/env bash

set -o pipefail

function print_header() {
    echo -e "\n***** ${1} *****"
}

function check_log() {
    LOG=$( { ${1}; } 2>&1 )
    STATUS=$?
    echo "$LOG"
    if echo "$LOG" | grep -q -E "${2}"
    then
        exit 1
    fi

    if [ $STATUS -ne 0 ]
    then
        exit $STATUS
    fi
}

print_header "RUN cppcheck"
check_log "cppcheck -q -j4 --enable=warning,style,performance,portability ./BitCounter/BitCounter.cpp ./BitCounter/BitCounter.h"

print_header "RUN clang-format"
# check_log "clang-format -i ../BitCounter/BitCounter.h"
check_log "clang-format -i -style=file ./BitCounter/*.cpp ./BitCounter/*.h"

print_header "RUN cpplint"
check_log "cpplint --extensions=c++ ./BitCounter/*" "Can't open for reading"

print_header "SUCCESS"