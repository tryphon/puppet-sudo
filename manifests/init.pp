class sudo {

  package { sudo: ensure => installed }

  define user_line($line) {
    line { "sudo-$name":
      file => "/etc/sudoers",
      line => $line
    }
  }

  user_line { root: line => "root	ALL=(ALL) ALL" }
  user_line { adm: line => "%adm	ALL=(ALL) ALL" }

}

class sudo::ssh_agent_auth {

  package { libpam-ssh-agent: require => Apt::Sources_list[tryphon] }

  file { "/etc/pam.d/sudo":
    source => "puppet:///sudo/sudo.pam",
    require => Package[libpam-ssh-agent]
  }

  line { "sudoers_env_keep_ssh_auth_sock":
    file => "/etc/sudoers",
    line => "Defaults env_keep += SSH_AUTH_SOCK",
    require => Package[libpam-ssh-agent]
  }

}
