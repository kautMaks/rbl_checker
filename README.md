# rbl_checker
CLI tool for check persistence of IPv4 or domain in blacklist databases.
List of databes was taken from [multirbl.valli.org](https://multirbl.valli.org/list/).
All databases, that supports IPv4 or domain was included, except Abusix (due to their lookup policies).

## rbl_checks_combined
Takes IPv4 as an argument, check it, then gets PTR by IP and also checks it.
[rbl_check_full.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_combined/rbl_check_full.sh) - returns a detailed response (by every blacklist).
[rbl_check_short.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_combined/rbl_check_short.sh) - returns only list of blacklists, where IPv4 or domain presents.

## rbl_checks_separate
Takes IPv4 or domain as an argument and checks only by it.
[rbl_check_domain_full.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_separate/rbl_check_domain_full.sh) - returns a detailed response (by every blacklist) for domain.
[rbl_check_domain_short.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_separate/rbl_check_domain_short.sh) - returns only list of blacklists, where domain presents.
[rbl_check_ip4_full.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_separate/rbl_check_ip4_full.sh) - returns a detailed response (by every blacklist) for IPv4.
[rbl_check_ip4_short.sh](https://github.com/kautMaks/rbl_checker/blob/main/rbl_checks_separate/rbl_check_ip4_short.sh) - returns only list of blacklists, where IPv4 presents.

