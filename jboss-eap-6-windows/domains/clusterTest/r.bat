@echo off
rem -------------------------------------------------------------------------
rem JBoss Bootstrap Script for Windows
rem -------------------------------------------------------------------------

java -cp jgroups-3.2.5.Final.jar org.jgroups.tests.McastReceiverTest -mcast_addr 224.10.10.10 -port 5555
