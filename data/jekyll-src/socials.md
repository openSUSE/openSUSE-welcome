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
title: {{socialTrans.socialMedia}}
---
## {{socialTrans.reachUs}}

{{socialTrans.smSubtitle}}

### {{socialTrans.smDiscord}}

{% include link onclick="bridge.openURL('https://discord.gg/openSUSE')" text="{{socialTrans.smDiscord}}" class="btn btn-discord" %}

### {{socialTrans.smFacebook}}

{% include link onclick="bridge.openURL('https://www.facebook.com/groups/opensuseproject/')" text="{{socialTrans.smFacebookGroup}}" class="btn btn-facebook" %}

### {{socialTrans.smForums}}

{% include link onclick="bridge.openURL('https://forums.opensuse.org')" text="{{socialTrans.smOpenSuseForums}}" class="btn btn-openSUSE" %}

### {{socialTrans.smIRC}}

{% include link onclick="bridge.openURL('irc://irc.opensuse.org/#opensuse')" text="{{socialTrans.smIRCTechSupport}}" class="btn btn-openSUSE" %}
{% include link onclick="bridge.openURL('irc://irc.opensuse.org/#opensuse-project')" text="{{socialTrans.smIRCProject}}" class="btn btn-openSUSE" %}
{% include link onclick="bridge.openURL('irc://irc.opensuse.org/#opensuse-factory')" text="{{socialTrans.smIRCFactory}}" class="btn btn-openSUSE" %}
{% include link onclick="bridge.openURL('irc://irc.opensuse.org/#opensuse-chat')" text="{{socialTrans.smIRCChat}}" class="btn btn-openSUSE" %}

### {{socialTrans.smTelegram}}

{% include link onclick="bridge.openURL('https://t.me/openSUSE_group')" text="{{socialTrans.smTelegramOpenSuseGroup}}" class="btn btn-telegram" %}
{% include link onclick="bridge.openURL('https://t.me/opensusenews')" text="{{socialTrans.smTelegramOpenSuseNews}}" class="btn btn-telegram" %}
