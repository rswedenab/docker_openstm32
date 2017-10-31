FROM ubuntu:14.04

RUN dpkg --add-architecture i386 && \
apt-get update && apt-get -y install build-essential vim-common wget git bzip2 make python libc6:i386 astyle clang && \
wget http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-latest.run && \
mkdir -p /usr/local/SystemWorkbench/ && \
cat >auto-install <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<AutomatedInstallation langpack="eng">
<com.izforge.izpack.panels.userinput.UserInputPanel id="warningPanel"/>
<com.izforge.izpack.panels.info.InfoPanel id="InfoPanel_1"/>
<com.izforge.izpack.panels.licence.LicencePanel id="SWLicence"/>
<com.izforge.izpack.panels.licence.LicencePanel id="JRELicence"/>
<com.izforge.izpack.panels.target.TargetPanel id="TargetPanel_4">
<installpath>/usr/local/SystemWorkbench</installpath>
</com.izforge.izpack.panels.target.TargetPanel>
<com.izforge.izpack.panels.packs.PacksPanel id="PacksPanel_5">
<pack index="0" name="System Workbench for STM32" selected="true"/>
<pack index="1" name="ST-Link/V2 driver" selected="true"/>
<pack index="2" name="STLinkServer" selected="true"/>
</com.izforge.izpack.panels.packs.PacksPanel>
<com.izforge.izpack.panels.summary.SummaryPanel id="SummaryPanel_6"/>
<com.izforge.izpack.panels.install.InstallPanel id="InstallPanel_7"/>
<com.izforge.izpack.panels.process.ProcessPanel id="ProcessPanel_8"/>
<com.izforge.izpack.panels.finish.FinishPanel id="FinishPanel_9"/>
</AutomatedInstallation>
EOF && \
./install_sw4stm32_linux_64bits-latest.run auto-install 