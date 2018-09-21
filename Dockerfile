FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install software-properties-common python-software-properties \
                                 build-essential vim-common wget git bzip2 make python astyle clang

RUN wget http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-latest.run && \
    chmod a+x install_sw4stm32_linux_64bits-latest.run && \
    mkdir -p /usr/local/SystemWorkbench/
  
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update && \
    apt-get -y install oracle-java8-installer oracle-java8-set-default

RUN touch auto-install.xml
RUN  echo \<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?\> > ./auto-install.xml  && \ 
  echo \<AutomatedInstallation langpack=\"eng\"\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.userinput.UserInputPanel id=\"warningPanel\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.info.InfoPanel id=\"InfoPanel_1\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.licence.LicencePanel id=\"SWLicence\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.licence.LicencePanel id=\"JRELicence\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.target.TargetPanel id=\"TargetPanel_4\"\> >> ./auto-install.xml  && \ 
  echo \<installpath\>\/usr\/local\/SystemWorkbench\</installpath\> >> ./auto-install.xml  && \ 
  echo \</com.izforge.izpack.panels.target.TargetPanel\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.packs.PacksPanel id=\"PacksPanel_5\"\> >> ./auto-install.xml  && \ 
  echo \<pack index=\"0\" name=\"System Workbench for STM32\" selected=\"true\"/\> >> ./auto-install.xml  && \ 
  echo \<pack index=\"1\" name=\"ST-Link/V2 driver\" selected=\"true\"/\> >> ./auto-install.xml  && \ 
  echo \<pack index=\"2\" name=\"STLinkServer\" selected=\"true\"/\> >> ./auto-install.xml  && \ 
  echo \</com.izforge.izpack.panels.packs.PacksPanel\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.summary.SummaryPanel id=\"SummaryPanel_6\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.install.InstallPanel id=\"InstallPanel_7\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.process.ProcessPanel id=\"ProcessPanel_8\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.finish.FinishPanel id=\"FinishPanel_9\"/\> >> ./auto-install.xml  && \ 
  echo \</AutomatedInstallation\> >> ./auto-install.xml && \
  cat ./auto-install.xml
  RUN ./install_sw4stm32_linux_64bits-latest.run -f auto-install.xml 
  
  RUN  ls -la /usr/local/SystemWorkbench/&& \
  tar -xf /usr/local/SystemWorkbench/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.15.0.201708311556/tools/st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3-20160926-linux.tar.bz2  -C /usr/local/SystemWorkbench/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.15.0.201708311556/tools &&\
  PATH=/usr/local/SystemWorkbench/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.15.0.201708311556/tools/st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3/bin:$PATH 

