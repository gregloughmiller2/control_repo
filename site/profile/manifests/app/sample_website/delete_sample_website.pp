class profile::app::sample_website::delete_sample_website (
  String $doc_root           = 'C:\inetpub\wwwroot\sample_website',
  String $webserver_port     = '80',
  String $apppool            = 'sample_website',
  String $website_source_dir = 'puppet:///modules/profile/app/sample_website'
) {

  file { "${doc_root}/index.html":
    ensure  => absent,
###    content => epp('profile/app/sample_website.html.epp'),
  }
  
  

  iis_site { 'sample_website':
    ensure          => absent,
    physicalpath    => $doc_root,
    applicationpool => $apppool,
  }

  iis_application_pool { 'sample_website':
    ensure  =>  absent,
  }
  
}