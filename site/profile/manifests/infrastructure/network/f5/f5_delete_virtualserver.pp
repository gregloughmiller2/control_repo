class profile::infrastructure::network::f5::f5_delete_virtualserver {

f5_virtualserver { '/Common/puppet_vs1':
    ensure                    => 'absent',
  }
f5_pool { '/Common/puppet_pool':
    ensure                    => 'absent',
    require  =>  f5_virtualserver['/Common/puppet_vs1'],
  }
f5_node { '/Common/WWW_Server_1':
    ensure                   => 'absent',
    require  =>  f5_pool['/Common/puppet_pool'],
  }
f5_node { '/Common/WWW_Server_2':
    ensure                   => 'absent',
    require  =>  f5_node['/Common/WWW_Server_1'],
  }
}
