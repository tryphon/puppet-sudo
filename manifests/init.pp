class sudo {
  package { sudo: ensure => installed }

  if $debian::wheezy {
    file_line { 'sudoers_secure_path':
      path => '/etc/sudoers',
      line => 'Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
    }
  }

  sudo::user_line { root: line => "root	ALL=(ALL) ALL" }
  sudo::user_line { adm: line => "%adm	ALL=(ALL) NOPASSWD: ALL" }

  sudo::user_line { 'includedir': line => "#includedir /etc/sudoers.d" }
}
