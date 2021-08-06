#!/bin/bash
#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

SMT_CONROL_PATH=/sys/devices/system/cpu/smt/control
echo "off" > "${SMT_CONTROL_PATH}"
echo "wrote \"off\" to ${SMT_CONTROL_PATH}"

# Restart kubelet so it picks up changes to # of CPUs.
echo "restarting kublet"
systemctl restart kubelet
echo "restarted kubelet"
