FROM heliumdatastage/rstudio-server:1
RUN usermod -a -G users rstudio
RUN echo '#!/usr/bin/with-contenv bash \
          \n## load /etc/environment vars first: \
          \n for line in $( cat /etc/environment ) ; do export $line ; done \
          \n cp /etc/rstudio/rserver.conf /etc/rstudio/rserver.conf.bak \
          \n cat /etc/rstudio/rserver.conf.bak | grep -v www-frame-origin > /etc/rstudio/rserver.conf \
          \n echo www-frame-origin=${WWW_FRAME_ORIGIN} >> /etc/rstudio/rserver.conf \
          \n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0' \
          > /etc/services.d/rstudio/run
