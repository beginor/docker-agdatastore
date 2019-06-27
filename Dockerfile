FROM ubuntu:18.04

LABEL MAINTAINER="beginor <beginor@qq.com>"

COPY ["src/0_base_system.sh", "src/1_install_agdatastore.sh", "/tmp/"]
# Create arcgis user
RUN /tmp/0_base_system.sh
# Switch to arcgis and install ArcGIS for Portal
USER arcgis
ENV HOME /arcgis
RUN /tmp/1_install_agdatastore.sh
COPY ["src/docker_entry_point.sh", "/arcgis"]
ENTRYPOINT ["/arcgis/docker_entry_point.sh"]
