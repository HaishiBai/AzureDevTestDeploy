
###########################################################################
# Setup the machine you need to run the demo's here
###########################################################################

source script/config.sh

echo "##########################################################################################"
echo "Creating "$DEV_MACHINE_TYPE" machine for development with name $DEV_MACHINE_NAME"
echo "##########################################################################################"

case "$DEV_MACHINE_TYPE" in
  hyper-v)
      docker-machine create -d $DEV_MACHINE_TYPE $DEV_MACHINE_NAME
      docker-machine env $DEV_MACHINE_NAME
      ;;
  azure)
      docker-machine create -d azure --azure-location="$AZURE_LOCATION" --azure-subscription-id="$AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="$AZURE_CERT_NAME" $DEV_MACHINE_NAME
      docker-machine env $DEV_MACHINE_NAME
      ;;
  *)
      echo "Can't create dev machine of type $DEV_MACHINE_TYPE"
      ;;
esac
  
echo "##########################################################################################"
echo "Creating "$STAGE_MACHINE_TYPE" machine for development with name $STAGE_MACHINE_NAME"
echo "##########################################################################################"

case "$STAGE_MACHINE_TYPE" in
  azure)
      docker-machine create -d azure --azure-location="$AZURE_LOCATION" --azure-subscription-id="$AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="$AZURE_CERT_NAME" $STAGE_MACHINE_NAME
      ;;
  
  swarm-azure)
      source script/create_stage_swarm.sh
      ;;
  
  *) echo "ERROR: Cannot create Stage machine of type $STAGE_MACHINE_TYPE"
     ;;
esac

echo "Unless an error is reported above your VM is now ready to use"
echo "Remember, you will need to open appropriate endpoints on your VM if you want to access Docker containers from elsewhere"
