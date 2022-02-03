#!/bin/sh

# Check if an IP address is listed on one of the following blacklists
# The format is chosen to make it easy to add or delete
# The shell will strip multiple whitespace

DNS="1.1.1.1"
ABUSIX_API_KEY=""

ABUSIX_BLIST_IP4="
    combined.mail.abusix.zone
"

BLISTS_IP4="
    0spam-n.fusionzero.com
    0spam.fusionzero.com
    88.blocklist.zap
    access.redhawk.org
    admin.bl.kundenserver.de
    all.s5h.net
    all.spam-rbl.fr
    all.spamrats.com
    aspews.ext.sorbs.net
    auth.spamrats.com
    b.barracudacentral.org
    backscatter.spameatingmonkey.net
    bb.barracudacentral.org
    bl-h1.rbl.polspam.pl
    bl-h2.rbl.polspam.pl
    bl-h3.rbl.polspam.pl
    bl-h4.rbl.polspam.pl
    bl.0spam.org
    bl.blocklist.de
    bl.drmx.org
    bl.fmb.la
    bl.konstant.no
    bl.mailspike.net
    bl.mav.com.br
    bl.mipspace.com
    bl.nordspam.com
    bl.nosolicitado.org
    bl.nszones.com
    bl.octopusdns.com
    bl.rbl.polspam.pl
    bl.scientificspam.net
    bl.score.senderscore.com
    bl.spamcop.net
    bl.spameatingmonkey.net
    bl.suomispam.net
    bl.tiopan.com
    bl.worst.nosolicitado.org
    black.dnsbl.brukalai.lt
    black.junkemailfilter.com
    blackholes.scconsult.com
    blacklist.mail.ops.asp.att.net
    blacklist.mailrelay.att.net
    blacklist.sci.kun.nl
    blacklist.sequoia.ops.asp.att.net
    blacklist.woody.ch
    block.ascams.com
    block.dnsbl.sorbs.net
    bogons.cymru.com
    bsb.empty.us
    bsb.spamlookup.net
    cbl.abuseat.org
    cidr.bl.mcafee.com
    cnkr.rbl.polspam.pl
    combined.rbl.msrbl.net
    db.wpbl.info
    dnsbl-0.uceprotect.net
    dnsbl-1.uceprotect.net
    dnsbl-2.uceprotect.net
    dnsbl-3.uceprotect.net
    dnsbl.abyan.es
    dnsbl.anticaptcha.net
    dnsbl.beetjevreemd.nl
    dnsbl.calivent.com.pe
    dnsbl.cobion.com
    dnsbl.cyberlogic.net
    dnsbl.darklist.de
    dnsbl.dronebl.org
    dnsbl.forefront.microsoft.com
    dnsbl.isx.fr
    dnsbl.justspam.org
    dnsbl.kempt.net
    dnsbl.madavi.de
    dnsbl.mcu.edu.tw
    dnsbl.net.ua
    dnsbl.rv-soft.info
    dnsbl.rymsho.ru
    dnsbl.sorbs.net
    dnsbl.spfbl.net
    dnsbl.tornevall.org
    dnsbl.zapbl.net
    dnsbl1.dnsbl.borderware.com
    dnsbl2.dnsbl.borderware.com
    dnsbl3.dnsbl.borderware.com
    dnsblchile.org
    dnsrbl.swinog.ch
    dul.blackhole.cantv.net
    dul.dnsbl.borderware.com
    dul.dnsbl.sorbs.net
    dul.pacifier.net
    dyn.nszones.com
    dyn.rbl.polspam.pl
    dyna.spamrats.com
    escalations.dnsbl.sorbs.net
    feb.spamlab.com
    fnrbl.fast.net
    forbidden.icm.edu.pl
    free.v4bl.org
    gl.suomispam.net
    hil.habeas.com
    hog.blackhole.cantv.net
    http.dnsbl.sorbs.net
    images.rbl.msrbl.net
    ip.v4bl.org
    ip4.bl.zenrbl.pl
    ipbl.zeustracker.abuse.ch
    ips.backscatterer.org
    ix.dnsbl.manitu.net
    korea.services.net
    l1.bbfh.ext.sorbs.net
    l2.bbfh.ext.sorbs.net
    l3.bbfh.ext.sorbs.net
    l4.bbfh.ext.sorbs.net
    lblip4.rbl.polspam.pl
    light.dnsbl.brukalai.lt
    list.bbfh.org
    list.blogspambl.com
    mail-abuse.blacklist.jippg.org
    misc.dnsbl.sorbs.net
    multi.surbl.org
    nbl.0spam.org
    netbl.spameatingmonkey.net
    netblockbl.spamgrouper.to
    netscan.rbl.blockedservers.com
    new.spam.dnsbl.sorbs.net
    niprbl.mailcleaner.net
    noptr.spamrats.com
    old.spam.dnsbl.sorbs.net
    openproxy.bls.digibase.ca
    orvedb.aupads.org
    pbl.spamhaus.org
    phishing.rbl.msrbl.net
    pofon.foobar.hu
    problems.dnsbl.sorbs.net
    proxies.dnsbl.sorbs.net
    proxyabuse.bls.digibase.ca
    psbl.surriel.com
    q.mail-abuse.com
    r.mail-abuse.com
    rbl.abuse.ro
    rbl.blakjak.net
    rbl.blockedservers.com
    rbl.choon.net
    rbl.dns-servicios.com
    rbl.efnet.org
    rbl.efnetrbl.org
    rbl.fasthosts.co.uk
    rbl.interserver.net
    rbl.iprange.net
    rbl.ircbl.org
    rbl.lugh.ch
    rbl.metunet.com
    rbl.rbldns.ru
    rbl.realtimeblacklist.com
    rbl.schulte.org
    rbl.spamlab.com
    rbl.tdk.net
    rbl.zenon.net
    rbl2.triumf.ca
    rblip4.rbl.polspam.pl
    recent.spam.dnsbl.sorbs.net
    relays.bl.kundenserver.de
    relays.dnsbl.sorbs.net
    relays.nether.net
    rhsbl.blackhole.cantv.net
    rot.blackhole.cantv.net
    rsbl.aupads.org
    safe.dnsbl.prs.proofpoint.com
    safe.dnsbl.sorbs.net
    sbl-xbl.spamhaus.org
    sbl.nszones.com
    sbl.spamdown.org
    sbl.spamhaus.org
    schizo-bl.kundenserver.de
    singular.ttk.pte.hu
    smtp.dnsbl.sorbs.net
    socks.dnsbl.sorbs.net
    spam.blackhole.cantv.net
    spam.dnsbl.anonmails.de
    spam.dnsbl.sorbs.net
    spam.pedantic.org
    spam.rbl.blockedservers.com
    spam.rbl.msrbl.net
    spam.spamrats.com
    spamblock.kundenserver.de
    spambot.bls.digibase.ca
    spamguard.leadmon.net
    spamlist.or.kr
    spamrbl.imp.ch
    spamsources.fabel.dk
    st.technovision.dk
    superblock.ascams.com
    tor.efnet.org
    torexit.dan.me.uk
    truncate.gbudb.net
    ubl.unsubscore.com
    unsure.nether.net
    v4.fullbogons.cymru.com
    virus.rbl.msrbl.net
    vote.drbl.caravan.ru
    vote.drbl.gremlin.ru
    web.dnsbl.sorbs.net
    web.rbl.msrbl.net
    work.drbl.caravan.ru
    work.drbl.gremlin.ru
    wormrbl.imp.ch
    worms-bl.kundenserver.de
    xbl.spamhaus.org
    z.mailspike.net
    zen.spamhaus.org
    zombie.dnsbl.sorbs.net
"

# simple shell function to show an error message and exit
#  $0  : the name of shell script, $1 is the string passed as argument
# >&2  : redirect/send the message to stderr

ERROR() {
  echo $0 ERROR: $1 >&2
  exit 2
}

# -- Sanity check on parameters
[ $# -ne 1 ] && ERROR 'Please specify a single IP address'

# -- if the address consists of 4 groups of minimal 1, maximal digits, separated by '.'
# -- reverse the order
# -- if the address does not match these criteria the variable 'reverse will be empty'

reverse=$(echo $1 |
  sed -ne "s~^\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)$~\4.\3.\2.\1~p")

if [ "x${reverse}" = "x" ] ; then
      ERROR  "IMHO '$1' doesn't look like a valid IP address"
      exit 1
fi

# Assuming an IP address of 11.22.33.44 as parameter or argument

# If the IP address in $0 passes our crude regular expression check,
# the variable  ${reverse} will contain 44.33.22.11
# In this case the test will be:
#   [ "x44.33.22.11" = "x" ]
# This test will fail and the program will continue

# An empty '${reverse}' means that shell argument $1 doesn't pass our simple IP address check
# In that case the test will be:
#   [ "x" = "x" ]
# This evaluates to true, so the script will call the ERROR function and quit

# -- cycle through the ipv4 Abusix blacklists
if [ ! -z "${ABUSIX_API_KEY}" ]; then
    for BL in ${ABUSIX_BLIST_IP4} ; do
        # use dig to lookup the name in the blacklist
        # echo "$(dig +short -t a ${reverse}.${BL}. @${DNS} |  tr '\n' ' ')"
        LISTED="$(dig +short -t a ${reverse}.${ABUSIX_API_KEY}.${BL}. @${DNS})"

        if [ ! -z "${LISTED}" ]; then
            echo ${BL}
        fi
    done
fi

# -- cycle through the ipv4 blacklists
for BL in ${BLISTS_IP4} ; do
    # use dig to lookup the name in the blacklist
    # echo "$(dig +short -t a ${reverse}.${BL}. @${DNS} |  tr '\n' ' ')"
    LISTED="$(dig +short -t a ${reverse}.${BL}. @${DNS})"

    if [ ! -z "${LISTED}" ]; then
        echo ${BL}
    fi
done

# --- EOT ------
