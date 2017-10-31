FROM ubuntu:14.04

RUN touch auto-install.xml
RUN  echo \<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?\> > ./auto-install.xml  && \ 
  echo \<AutomatedInstallation langpack=\"eng\"\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.userinput.UserInputPanel id=\"warningPanel\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.info.InfoPanel id=\"InfoPanel_1\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.licence.LicencePanel id=\"SWLicence\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.licence.LicencePanel id=\"JRELicence\"/\> >> ./auto-install.xml  && \ 
  echo \<com.izforge.izpack.panels.target.TargetPanel id=\"TargetPanel_4\"\> >> ./auto-install.xml  && \ 
  echo \<installpath>/home/kogo/test/build</installpath\> >> ./auto-install.xml  && \ 
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
  echo \</AutomatedInstallation\> >> ./auto-install.xml
