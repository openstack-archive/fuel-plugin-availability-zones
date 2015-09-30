class availability_zone::params {


  if $::osfamily == 'Debian' {
  

  } elsif($::osfamily == 'RedHat') {


  } else {
    fail("unsuported osfamily ${::osfamily}, currently Debian and Redhat are the only supported platforms")
  }
}
