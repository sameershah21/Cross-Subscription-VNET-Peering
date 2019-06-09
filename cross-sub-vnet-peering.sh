

HUB_SUBSCRIPTION_ID=
SPOKE_SUBSCRIPTION_ID=

REMOTE_VNET_ID_FOR_HUB=REMOTE_VNET_ID_FOR_SPOKE=

HUB_RESOURCE_GROUP_NAME=
SPOKE_RESOURCE_GROUP_NAME=

HUB_VNET_NAME=
SPOKE_VNET_NAME=

HUB_TO_SPOKE_CONNECTION_NAME=
SPOKE_TO_HUB_CONNECTION_NAME=

az login

az account set --subscription $HUB_SUBSCRIPTION_ID

az network vnet peering create \
      --name $HUB_TO_SPOKE_CONNECTION_NAME \
      --resource-group $HUB_RESOURCE_GROUP_NAME \
      --vnet-name $HUB_VNET_NAME \
      --remote-vnet-id $REMOTE_VNET_ID_FOR_HUB \
      --allow-vnet-access

az network vnet peering list \
  --resource-group $HUB_RESOURCE_GROUP_NAME \
  --vnet-name $HUB_VNET_NAME \
  --output table

az account set --subscription $SPOKE_SUBSCRIPTION_ID

az network vnet peering create \
      --name $SPOKE_TO_HUB_CONNECTION_NAME \
      --resource-group $SPOKE_RESOURCE_GROUP_NAME \
      --vnet-name $SPOKE_VNET_NAME \
      --remote-vnet-id $REMOTE_VNET_ID_FOR_SPOKE \
      --allow-vnet-access

az network vnet peering list \
  --resource-group $SPOKE_RESOURCE_GROUP_NAME \
  --vnet-name $SPOKE_VNET_NAME \
  --output table

az logout

exit 0
