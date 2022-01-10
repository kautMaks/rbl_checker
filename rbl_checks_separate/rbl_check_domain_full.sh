#!/bin/sh

# Check if domain is listed on one of the following blacklists
# The format is chosen to make it easy to add or delete
# The shell will strip multiple whitespace

DNS="1.1.1.1"

BLISTS_DOM="
    0spamurl.fusionzero.com
    abuse.rfc-clueless.org
    badconf.rhsbl.sorbs.net
    bl.fmb.la
    black.dnsbl.brukalai.lt
    black.junkemailfilter.com
    blacklist.netcore.co.in
    bogusmx.rfc-clueless.org
    bsb.empty.us
    bsb.spamlookup.net
    communicado.fmb.la
    d.bl.zenrbl.pl
    dbl.nordspam.com
    dbl.spamhaus.org
    dbl.suomispam.net
    dbl.tiopan.com
    dnsbl.abyan.es
    dnsbl.spfbl.net
    dob.sibl.support-intelligence.net
    dsn.rfc-clueless.org
    dul.blackhole.cantv.net
    elitist.rfc-clueless.org
    fresh.spameatingmonkey.net
    fresh10.spameatingmonkey.net
    fresh15.spameatingmonkey.net
    fresh30.spameatingmonkey.net
    freshzero.spameatingmonkey.net
    fulldom.rfc-clueless.org
    hog.blackhole.cantv.net
    light.dnsbl.brukalai.lt
    mailsl.dnsbl.rjek.com
    multi.surbl.org
    nomail.rhsbl.sorbs.net
    nsbl.fmb.la
    postmaster.rfc-clueless.org
    public.sarbl.org
    rhsbl-h.rbl.polspam.pl
    rhsbl.blackhole.cantv.net
    rhsbl.rbl.polspam.pl
    rhsbl.rymsho.ru
    rhsbl.scientificspam.net
    rhsbl.sorbs.net
    rhsbl.zapbl.net
    rot.blackhole.cantv.net
    short.fmb.la
    spam.blackhole.cantv.net
    ubl.nszones.com
    uri.blacklist.woody.ch
    uribl.abuse.ro
    uribl.mailcleaner.net
    uribl.pofon.foobar.hu
    uribl.rspamd.com
    uribl.spameatingmonkey.net
    uribl.swinog.ch
    uribl.zeustracker.abuse.ch
    urired.spameatingmonkey.net
    url.0spam.org
    urlsl.dnsbl.rjek.com
"

# simple shell function to show an error message and exit
#  $0  : the name of shell script, $1 is the string passed as argument
# >&2  : redirect/send the message to stderr

ERROR() {
  echo $0 ERROR: $1 >&2
  exit 2
}

# -- Sanity check on parameters
[ $# -ne 1 ] && ERROR 'Please specify a single domain'

# -- cycle through the domain blacklists
for BL in ${BLISTS_DOM} ; do

    # print the UTC date (without linefeed)
    printf $(env TZ=UTC date "+%Y-%m-%d_%H:%M:%S_%Z")

    # show the reversed IP and append the name of the blacklist
    printf "%-40s" " ${1}.${BL}."
    # use dig to lookup the name in the blacklist
    # echo "$(dig +short -t a ${1}.${BL}. @${DNS} |  tr '\n' ' ')"
    LISTED="$(dig +short -t a ${1}.${BL}. @${DNS})"
    echo ${LISTED:----}

done

# --- EOT ------
