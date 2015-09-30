$availability_zone = hiera('availability_zones')


$nb_av = $availability_zone['nb_av']

$label_zone_1 = $availability_zone['label_availability_zones_1']
$label_zone_2 = $availability_zone['label_availability_zones_2']
$label_zone_3 = $availability_zone['label_availability_zones_3']
$label_zone_4 = $availability_zone['label_availability_zones_4']

$array_zone_1 = split($availability_zone['availability_zones_1'], ',')
$array_zone_2 = split($availability_zone['availability_zones_2'], ',')
$array_zone_3 = split($availability_zone['availability_zones_3'], ',')
$array_zone_4 = split($availability_zone['availability_zones_4'], ',')

$nodes_hash  = hiera('nodes')

define add_host_zone1 {
  exec { "processing $name":
    command	=> "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-add-host $label_zone_1 $name'",
    unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-details $label_zone_1 | /bin/egrep \"$name\"'",
  }
}
define add_host_zone2 {
  exec { "processing $name":
    command	=> "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-add-host $label_zone_2 $name'",
    unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-details $label_zone_2 | /bin/egrep \"$name\"'",
  }
}
define add_host_zone3 {
  exec { "processing $name":
    command	=> "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-add-host $label_zone_3 $name'",
    unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-details $label_zone_3 | /bin/egrep \"$name\"'",
  }
}
define add_host_zone4 {
  exec { "processing $name":
    command	=> "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-add-host $label_zone_4 $name'",
    unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-details $label_zone_4 | /bin/egrep \"$name\"'",
  }
}

exec{ "Create $label_zone_1 zone":
command => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-create $label_zone_1 $label_zone_1'",
unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-list | /bin/egrep \"$label_zone_1\"'",
} ->
add_host_zone1 { $array_zone_1 : }


if $nb_av > 1 {
  exec{ "Create $label_zone_2 zone":
  command => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-create $label_zone_2 $label_zone_2'",
  unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-list | /bin/egrep \"$label_zone_2\"'",
  } ->
add_host_zone2 { $array_zone_2 : }
}

if $nb_av > 2 {
  exec{ "Create $label_zone_3 zone":
  command => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-create $label_zone_3 $label_zone_3'",
  unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-list | /bin/egrep \"$label_zone_3\"'",
  } ->
add_host_zone3 { $array_zone_3 : }
 }

if $nb_av > 3 {
  exec{ "Create $label_zone_4 zone":
  command => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-create $label_zone_4 $label_zone_4'",
  unless  => "/bin/bash -c 'source /root/openrc && /usr/bin/nova aggregate-list | /bin/egrep \"$label_zone_4\"'",
  } ->
add_host_zone4 { $array_zone_4 : }
}




