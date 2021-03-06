#!/bin/bash -xe
# Copyright (C) 2014 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

# get rid of system-installed pip
for p in python-pip python3-pip ; do
    if apt-cache policy $p | grep -q 'Installed:.*[0-9]' ; then
        sudo apt-get remove -y $p
    fi
done

# install pip using get-pip
PIP_GET_PIP_URL=https://bootstrap.pypa.io/get-pip.py
if [ ! -f get-pip.py ] ; then
    curl -O $PIP_GET_PIP_URL || wget $PIP_GET_PIP_URL
fi
sudo -H python get-pip.py
