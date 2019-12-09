#!/bin/bash
firewall-cmd --zone=public --add-port=3389/tcp --permanent
firewall-cmd --zone=public --add-port=6808/tcp --permanent
firewall-cmd --zone=public --add-port=61080/tcp --permanent 
firewall-cmd --zone=public --add-port=6006/tcp --permanent   
firewall-cmd --reload
