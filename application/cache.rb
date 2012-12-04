use Rack::Cache,
  :metastore   => 'file:./public/cache/rack/meta',  # change these top be somewhere like /var/cache/rack/meta
  :entitystore => 'file:./public/cache/rack/body',  # change these top be somewhere like /var/cache/rack/meta
  :verbose     => true