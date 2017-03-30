define sudo::conf($content) {
  file { "/etc/sudoers.d/$name":
    mode    => '0440',
    content => "$content\n",
    require => [Package['sudo'], Sudo::User_Line['includedir']]
  }
}
