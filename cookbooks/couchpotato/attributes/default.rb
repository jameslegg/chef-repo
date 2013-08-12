#
# Cookbook Name:: couchpotato
# Attributes:: default
#
# Copyright 2013, James Legg  <mail@jamesless.co.uk>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
default["couchpotato"]["user"] = 'couchpotato'
default["couchpotato"]["group"] = 'couchpotato'

default["couchpotato"]["install_dir"] = '/srv/apps/couchpotato'
default["couchpotato"]["log_dir"] = '/var/log'

# Valid Options: 
#  bluepill
default["couchpotato"]["init_style"] = 'bluepill'

# Git Options
default["couchpotato"]["git_url"] = 'https://github.com/RuudBurger/CouchPotatoServer.git'
default["couchpotato"]["git_ref"] = 'master'
