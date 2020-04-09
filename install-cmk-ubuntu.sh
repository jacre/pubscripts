

apt-get install check-mk-agent xinetd

cat <<EOT > /etc/xinetd.d/check_mk
service check_mk
{
        type           = UNLISTED
        port           = 6556
        socket_type    = stream
        protocol       = tcp
        wait           = no
        user           = root
        server         = /usr/bin/check_mk_agent
        log_on_success =
        disable        = no
}
EOT

service xinetd reload


