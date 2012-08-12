post-receive hook for the Music Ontology
========================================

A very small Sinatra application handling post-receive
WebHooks from Github, for the [Music Ontology specification](https://github.com/motools/musicontology).

As soon as this application is pinged, the latest version of the code
will be pulled, the specification regenerated, and the website updated.
