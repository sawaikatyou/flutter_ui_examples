lcov -r coverage/lcov.info *generated* -o coverage/lcov.info
lcov -r coverage/lcov.info *debug* -o coverage/lcov.info
lcov -r coverage/lcov.info *_http* -o coverage/lcov.info
lcov -r coverage/lcov.info *_dioextend* -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
