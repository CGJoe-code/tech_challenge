# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include tech_challenge::routing
class tech_challenge::routing {
  exec{'routing':
    command =>  "iptables -A PREROUTING -t nat -i eth0 -p tcp --dport ${::tech_challenge::to_port} -j REDIRECT --to-port 8000",
    path    =>  '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    user    =>  'root',
  }
}
