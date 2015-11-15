node 'leaf1.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.1'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = [
        { 'id' => 'br0', 'address' => '10.4.1.1', 'netmask' => '25', 'members' => ['swp30','swp31','swp32','swp33'] },
        { 'id' => 'br1', 'address' => '10.4.1.129', 'netmask' => '25', 'members' => ['swp34','swp35','swp36','swp37'] }
    ]
    include ospfunnum::role::switchbase
}

node 'leaf2.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.2'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = [
        { 'id' => 'br0', 'address' => '10.4.2.1', 'netmask' => '25', 'members' => ['swp30','swp31','swp32','swp33'] },
        { 'id' => 'br1', 'address' => '10.4.2.129', 'netmask' => '25', 'members' => ['swp34','swp35','swp36','swp37'] }
    ]
    include ospfunnum::role::switchbase
}
