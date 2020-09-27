# [rev1]
# 全ソース出力
# _http のように引き込んだだけのものが集計に含まれるのでよろしくない
# flutter test --coverage
# genhtml coverage/lcov.info -o coverage/html

# [rev2]
# debug / _http / _dioextend 配下を排除
flutter test --coverage
lcov -r ./coverage/lcov.info *generated* -o ./coverage/lcov.info
lcov -r ./coverage/lcov.info *debug* -o ./coverage/lcov.info
lcov -r ./coverage/lcov.info *_http* -o ./coverage/lcov.info
lcov -r ./coverage/lcov.info *_dioextend* -o ./coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html