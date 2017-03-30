class sudo::ssh_agent_auth {

  package { libpam-ssh-agent: require => Apt::Sources_list[tryphon] }

  file { '/etc/pam.d/sudo':
    source  => 'puppet:///modules/sudo/sudo.pam',
    require => Package[libpam-ssh-agent]
  }

  file_line { 'sudoers_env_keep_ssh_auth_sock':
    path    => '/etc/sudoers',
    line    => 'Defaults env_keep += SSH_AUTH_SOCK',
    require => Package[libpam-ssh-agent]
  }

}
