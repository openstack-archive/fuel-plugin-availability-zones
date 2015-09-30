$availability_zone = hiera('availability_zones')
$nb_av = $availability_zone['nb_av']

class { 'availability_zones':
    nb_av           => $availability_zone['nb_av'],
    label_zone_1    => $availability_zone['label_availability_zones_1'],
    label_zone_2    => $availability_zone['label_availability_zones_2'],
    label_zone_3    => $availability_zone['label_availability_zones_3'],
    label_zone_4    => $availability_zone['label_availability_zones_4'],
    zone_1          => $availability_zone['availability_zones_1'],
    zone_2          => $availability_zone['availability_zones_2'],
    zone_3          => $availability_zone['availability_zones_3'],
    zone_4          => $availability_zone['availability_zones_4'],
}