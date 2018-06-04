FROM freeradius/freeradius-server:3.0.17
COPY raddb/ /etc/raddb/
COPY default /etc/raddb/sites-available/default
COPY eap.nc /etc/raddb/mods-available/eap
