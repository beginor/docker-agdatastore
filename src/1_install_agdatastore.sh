#!/bin/bash -e

curl --location --out /arcgis/ArcGIS_DataStore_Linux_107_167719.tar.gz \
  http://172.21.68.68/Downloads/ArcGIS_DataStore_Linux_107_167719.tar.gz

tar -zxvf /arcgis/ArcGIS_DataStore_Linux_107_167719.tar.gz -C /arcgis/
rm /arcgis/ArcGIS_DataStore_Linux_107_167719.tar.gz

/arcgis/ArcGISDataStore_Linux/Setup -m silent -l yes -d /
rm -rf /arcgis/ArcGISDataStore_Linux
