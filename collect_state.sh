#!/bin/bash
# writes oc output to sub directory [current projectname]
#
PROJECT=$(oc project --short=true)
mkdir $PROJECT
# EVENTS
echo "EVENTS"
oc get events -o wide > "${PROJECT}/oc_get_events.txt"
# PODS
oc get pods  > "${PROJECT}/oc_get_pods.txt"
echo "PODS"
for POD in $( oc get pods     | grep -v NAME | awk '{print $1}' ); do
        echo "   $POD"
        oc describe pods $POD  > "${PROJECT}/oc_describe_pods_${POD}.txt"
        oc logs $POD           > "${PROJECT}/oc_logs_${POD}.txt"
        oc export pods $POD         > "${PROJECT}/oc_export_${POD}.txt"
done
# BUILD CONFIGS
echo "BUILD CONFIGS"
oc get bc -o wide > "${PROJECT}/oc_get_bc.txt"
for BC in $( oc get bc       | grep -v NAME | awk '{print $1}' ); do
        echo "   $BC"
        oc describe dc $BC     > "${PROJECT}/oc_describe_bc_${BC}.txt"
        oc export dc $BC       > "${PROJECT}/oc_export_bc_${BC}.txt"
done
# REPLICATION CONTROLLERS
echo "REPLICATION CONTROLLERS"
oc get rc -o wide >  "${PROJECT}/oc_get_rc.txt"
for RC in $( oc get rc       | grep -v NAME | awk '{print $1}' ); do
        echo "   $RC"
        oc describe rc $RC     > "${PROJECT}/oc_describe_rc_${RC}.txt"
        oc export rc $RC       > "${PROJECT}/oc_export_rc_${RC}.txt"
done
# SERVICES
echo "SERVICES"
oc get services -o wide > "${PROJECT}/oc_get_services.txt"
for SERVICE in $( oc get services | grep -v NAME | awk '{print $1}' ); do
        echo "   $SERVICE"
        oc describe service $SERVICE > "${PROJECT}/oc_describe_service_${SERVICE}.txt"
        oc export service $SERVICE   > "${PROJECT}/oc_export_service_${SERVICE}.txt"
done
# ROUTE
echo "ROUTES"
oc get routes -o wide > "${PROJECT}/oc_get_routes.txt"
for ROUTE in $( oc get routes | grep -v NAME | awk '{print $1}' ); do
        echo "   $ROUTE"
        oc describe route $ROUTE > "${PROJECT}/oc_describe_route_${ROUTE}.txt"
        oc export route $ROUTE   > "${PROJECT}/oc_export_route_${ROUTE}.txt"
done
# DEPLOYMENT CONFIGS
echo "DEPLOYMENT CONFIGS"
oc get dc -o wide > "${PROJECT}/oc_get_dc.txt"
for DC in $( oc get dc       | grep -v NAME | awk '{print $1}' ); do
        echo "   $DC"
        oc describe dc $DC     > "${PROJECT}/oc_describe_dc_${DC}.txt"
        oc export dc $DC       > "${PROJECT}/oc_export_dc_${DC}.txt"
done
# PERSISTENT VOLUMES
echo "PERSISTENT VOLUMES"
oc get pv -o wide >  "${PROJECT}/oc_get_pv.txt"
for PV in $(oc get pv        | grep -v NAME | grep ${PROJECT} | awk '{print $1}' ); do
        echo "   $PV"
        oc describe pv $PV     >  "${PROJECT}/oc_get_pv_${PV}.txt"
        oc export pv $PV       >  "${PROJECT}/oc_get_pv_${PV}.txt"
done
# PERSISTENT VOLUME CLAIMS
echo "PERSISTENT VOLUME CLAIMS"
oc get pvc -o wide >  "${PROJECT}/oc_get_pvc.txt"
for PVC in $( oc get pvc       | grep -v NAME | awk '{print $1}' ); do
        echo "   $PVC"
        oc describe pvc $PVC   > "${PROJECT}/oc_describe_pvc_${PVC}.txt"
        oc export pvc $PVC     > "${PROJECT}/oc_export_pvc_${PVC}.txt"
done
# SECRETS
echo "SECRETS"
oc get secrets -o wide > "${PROJECT}/oc_get_secrets.txt"
for SECRET in $( oc get secrets  | grep -v NAME | awk '{print $1}' ); do
        echo "   $SECRET"
        oc describe secret $SECRET > "${PROJECT}/oc_describe_secret_${SECRET}.txt"
        oc export secret $SECRET   > "${PROJECT}/oc_export_secret_${SECRET}.txt"
done
# CONFIG MAPS
echo "CONFIG MAPS"
oc get configmap -o wide > "${PROJECT}/oc_get_configmaps.txt"
for CONFIGMAP in $( oc get configmap  | grep -v NAME | awk '{print $1}' ); do
        echo "   $CONFIGMAP"
        oc describe configmap $CONFIGMAP > "${PROJECT}/oc_describe_configmap_${CONFIGMAP}.txt"
        oc export configmap $CONFIGMAP   > "${PROJECT}/oc_export_configmap_${CONFIGMAP}.txt"
done
# TEMPLATES
echo "TEMPLATES"
oc get templates -o wide > "${PROJECT}/oc_get_templates.txt"
for TEMPLATE in $( oc get templates  | grep -v NAME | awk '{print $1}' ); do
        echo "   $TEMPLATE"
        oc describe template $TEMPLATE > "${PROJECT}/oc_describe_template_${TEMPLATE}.txt"
        oc export template $TEMPLATE   > "${PROJECT}/oc_export_template_${TEMPLATE}.txt"
done
# SERVICE ACCOUNT
echo "SERVICE ACCOUNT"
oc get serviceaccount -o wide > "${PROJECT}/oc_get_serviceaccounts.txt"
for SERVICEACCOUNT in $( oc get serviceaccount  | grep -v NAME | awk '{print $1}' ); do
        echo "   $SERVICEACCOUNT"
        oc describe serviceaccount $SERVICEACCOUNT > "${PROJECT}/oc_describe_serviceaccount_${SERVICEACCOUNT}.txt"
        oc export serviceaccount $SERVICEACCOUNT   > "${PROJECT}/oc_export_serviceaccount_${SERVICEACCOUNT}.txt"
done
