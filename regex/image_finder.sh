#!/bin/bash

find ./ -name '*' -exec file {} \; | grep -o -E '^.+: \w+ image'