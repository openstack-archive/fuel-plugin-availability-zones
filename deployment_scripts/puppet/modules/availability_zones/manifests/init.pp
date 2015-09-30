class availability_zones (
$nb_av,
$label_zone_1,
$label_zone_2,
$label_zone_3,
$label_zone_4,
$zone_1,
$zone_2,
$zone_3,
$zone_4,
){
     nova_aggregate { $label_zone_1:
        ensure          => 'present',
        name            => $label_zone_1,
        availability_zone => $label_zone_1,
        hosts           => $zone_1,
      }
  if $nb_av > 1 {
     nova_aggregate { $label_zone_2:
        ensure          => 'present',
        name            => $label_zone_2,
        availability_zone => $label_zone_2,
        hosts           => $zone_2,
      }
  }
  if $nb_av > 2 {
     nova_aggregate { $label_zone_3:
        ensure          => 'present',
        name            => $label_zone_3,
        availability_zone => $label_zone_3,
        hosts           => $zone_3,
      }
   }
  if $nb_av > 3 {
     nova_aggregate { $label_zone_4:
        ensure          => 'present',
        name            => $label_zone_4,
        availability_zone => $label_zone_4,
        hosts           => $zone_4,
      }
  }
}
