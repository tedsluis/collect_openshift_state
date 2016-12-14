# collect_openshift_state
  
collect script for OpenShift state, config and logging.
  
Collects the following objects from the current project (namespace) using the 'oc' command:
* EVENTS
* PODS
* BUILD CONFIGS
* REPLICATION CONTROLLERS
* SERVICES
* ROUTES
* DEPLOYMENT CONFIGS
* PERSISTENT VOLUMES
* PERSISTENT VOLUME CLAIMS
* SECRETS
* CONFIG MAPS
* TEMPLATES
* SERVICE ACCOUNTS
  
And writes it to a sub directory named [current project name].  


