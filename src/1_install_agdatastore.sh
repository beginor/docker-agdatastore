#!/bin/bash -e

curl --location --out /arcgis/ArcGIS_DataStore_Linux_1061_164056.tar.gz \
  http://172.17.0.1/ArcGIS_DataStore_Linux_1061_164056.tar.gz

tar -zxvf /arcgis/ArcGIS_DataStore_Linux_1061_164056.tar.gz -C /arcgis/
rm /arcgis/ArcGIS_DataStore_Linux_1061_164056.tar.gz

/arcgis/ArcGISDataStore_Linux/Setup -m silent -l yes -d /
rm -rf /arcgis/ArcGISDataStore_Linux
