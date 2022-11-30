# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include tech_challenge::install
if $::operatingsystem == 'CentOS' and $::operatingsystemrelease == 7 {
class tech_challenge::install {
  exec{'download':
    command =>  'wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo',
    path    =>  '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd     =>  '/etc/yum.repos.d',
    user    =>  'root',
    creates =>  '/etc/yum.repos.d/jenkins.repo',
    notify  =>  Exec['extract'],
  }
  exec{'extract':
    command     =>  'rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key',
    path        =>  '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd         =>  '/etc/yum.repos.d',
    user        =>  'root',
    refreshonly =>  true,
  }
  package{'jenkins':
    ensure  =>  installed,
  }
}
}
elsif $::operatingsystem == 'Ubuntu' and $::operatingsystemrelease == 20.04 {
class tech_challenge::install {
  exec{'download':
    command =>  'wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -',
    path    =>  '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd     =>  '/etc/apt/sources.list.d',
    user    =>  'root',
    creates =>  '/etc/yum.repos.d/jenkins.repo',
    notify  =>  Exec['extract'],
  }
  exec{'extract':
    command     =>  'sudo sh -c "echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"',
    path        =>  '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    cwd         =>  '/etc/apt/sources.list.d',
    user        =>  'root',
    refreshonly =>  true,
  }
  package{'jenkins':
    command =>  'sudo apt update',
    ensure  =>  installed,
  }
}
}
