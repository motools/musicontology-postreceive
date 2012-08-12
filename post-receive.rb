require 'rubygems'
require 'json'
require 'sinatra'

rev=`cd /opt/musicontology && git rev-parse --short HEAD`.chop

get '/' do
  "Revision: #{rev}"
end

post '/' do
  push = JSON.parse(params[:payload])
  $stderr.puts "JSON sent from GitHub: #{push.inspect}"
  # Pulling latest version from GitHub
  `cd /opt/musicontology && git pull`
  # Updating HTML spec
  `cd /opt/musicontology/doc && ./gen_spec.sh`
  # Copying spec to /var/www
  `cp /opt/musicontology/doc/musicontology.html /var/www/musicontology.com/html/index.html`
  `cp /opt/musicontology/rdf/musicontology.rdfs /var/www/musicontology.com/html/musicontology.rdfs`
  `cp /opt/musicontology/rdf/musicontology.n3 /var/www/musicontology.com/html/musicontology.n3`
end

