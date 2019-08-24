{% comment %}
    openSUSE Welcome - A welcome utility
    Copyright (C) 2019  Carson Black
    Copyright (C) 2019  Stasiek Michalski

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
{% endcomment %}
---
layout: sub
title: {{readTrans.readme}}
---
## {{readTrans.extras}}
{{readTrans.cannotInclude}}  
{{readTrans.readThisNvidia}} {% include link onclick="bridge.openURL('https://en.opensuse.org/SDB:NVIDIA_drivers')" text="{{readTrans.wikiArticle}}" %}.

{{readTrans.chrome}}

{{readTrans.packman}} {% include link onclick="bridge.openURL('https://en.opensuse.org/Additional_package_repositories')" text="{{readTrans.packmanhere}}" %}.

## {{readTrans.community}}

{{readTrans.on}} {% include link onclick="bridge.openURL('https://software.opensuse.org/explore')" text="software.opensuse.org" %}.
