#!/bin/sh

create_app(){
	az container create \
	    --resource-group appsvc_rg_Linux_centralus \
	    --name crackdetection \
	    --image sercanscontainerregistry.azurecr.io/crackdetection \
	    --dns-name-label crackdetection \
	    --ports 80 \
	    --azure-file-volume-account-name mystorageaccount4657 \
	    --azure-file-volume-account-key '8rbzTMDSeaowWR6vvV95uBfdAQL8YJreLZ6O+C+vh30SKfXIaDC4YdxwoaI7jhsspN2bluasdwAUahOExfj2Dw==' \
	    --azure-file-volume-share-name database \
	    --azure-file-volume-mount-path /mnt/share \
	    --gitrepo-url https://github.com/gungorser/CrackDetection.git \
	    --gitrepo-mount-path /mnt/CrackDetection
}

create_db(){
	az container create \
	    --resource-group appsvc_rg_Linux_centralus \
		--dns-name-label crackdetectiondb \
	    --name crackdetectiondb \
	    --image sercanscontainerregistry.azurecr.io/database \
	    --ports 5432
}