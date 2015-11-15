node 'spine1.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.3'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = [ ]
    include ospfunnum::role::switchbase
}

node 'spine2.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.4'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = [ ]
    include ospfunnum::role::switchbase
}

node 'leaf1.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.1'
    $int_unnumbered = [ 'swp1', 'swp2' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.1.1',
          'netmask' => '25',
          'members' => ['swp3'] },
    ]
    include ospfunnum::role::switchbase
}

node 'leaf2.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.2'
    $int_unnumbered = [ 'swp1', 'swp2' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.2.1',
          'netmask' => '25',
          'members' => ['swp3'] }
    ]
    include ospfunnum::role::switchbase
}
node 'leaf3.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.3'
    $int_unnumbered = [ 'swp1', 'swp2' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.3.1',
          'netmask' => '25',
          'members' => ['swp3'] }
    ]
    include ospfunnum::role::switchbase
}
node 'leaf4.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.4'
    $int_unnumbered = [ 'swp1', 'swp2' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.4.1',
          'netmask' => '25',
          'members' => ['swp3'] }
    ]
    include ospfunnum::role::switchbase
}
