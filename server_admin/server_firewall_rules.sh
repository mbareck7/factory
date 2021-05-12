#!/bin/bash

#Script to define default server rules
#we are using ufw(Uncomplicated Firewall) 
#by defautl ufw
# 1. deny incoming 
# 2. deny forwording
# 3. allow outgoing
# 4. with  stateful  tracking for NEW connections for incoming and forwarded connections.

ufw prepend allow ssh #allow ssh on top of rules
#allowed ports
ufw allow https
ufw allow http

#this will enable the firewall, clean existing rules, and apply above rules
ufw enable