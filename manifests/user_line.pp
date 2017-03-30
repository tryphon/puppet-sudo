define sudo::user_line($line) {
  file_line { "sudo-$name":
    path => '/etc/sudoers',
    line => $line
  }
}

