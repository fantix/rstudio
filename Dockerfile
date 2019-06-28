FROM heliumdatastage/rstudio-server:1
RUN usermod -a -G users rstudio
