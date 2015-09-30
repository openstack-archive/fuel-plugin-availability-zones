class availability_zones (){

$availability_zone = hiera('availability_zones')
$nb_av = $availability_zone['nb_av']

$label_zone_1 = $availability_zone['label_availability_zones_1']
$label_zone_2 = $availability_zone['label_availability_zones_2']
$label_zone_3 = $availability_zone['label_availability_zones_3']
$label_zone_4 = $availability_zone['label_availability_zones_4']


     nova_aggregate { $label_zone_1:
        ensure          => 'present',
        name            => $label_zone_1,
        availability_zone => $label_zone_1,
        hosts           => $availability_zone['availability_zones_1'],
      }
  if $nb_av > 1 {
     nova_aggregate { $label_zone_2:
        ensure          => 'present',
        name            => $label_zone_2,
        availability_zone => $label_zone_2,
        hosts           => $availability_zone['availability_zones_2'],
      }
  }
  if $nb_av > 2 {
     nova_aggregate { $label_zone_3:
        ensure          => 'present',
        name            => $label_zone_3,
        availability_zone => $label_zone_3,
        hosts           => $availability_zone['availability_zones_3'],
      }
   }
  if $nb_av > 3 {
     nova_aggregate { $label_zone_4:
        ensure          => 'present',
        name            => $label_zone_4,
        availability_zone => $label_zone_4,
        hosts           => $availability_zone['availability_zones_4'],
      }
  }
}
