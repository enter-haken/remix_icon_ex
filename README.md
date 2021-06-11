# RemixIconEx

<!-- MDOC -->

This repo provides elixir functions for the [RemixIcon][1] library (currently only line icons).
This is still **alpha** state.

```
iex(1)> RemixIconEx.
Buildings        Business         Communication    Design
Development      Device           Document         Fetch
Finance          Health           Logos            Map
Media            MixProject       Others           System
User             Weather
iex(1)> RemixIconEx.User.
account_box/0           account_box/1           account_circle/0
account_circle/1        account_pin_box/0       account_pin_box/1
account_pin_circle/0    account_pin_circle/1    admin/0
admin/1                 aliens/0                aliens/1
bear_smile/0            bear_smile/1            body_scan/0
body_scan/1             contacts/0              contacts/1
criminal/0              criminal/1              emotion/0
emotion/1               emotion_2/0             emotion_2/1
emotion_happy/0         emotion_happy/1         emotion_laugh/0
emotion_laugh/1         emotion_normal/0        emotion_normal/1
emotion_sad/0           emotion_sad/1           emotion_unhappy/0
emotion_unhappy/1       genderless/0            genderless/1
ghost/0                 ghost/1                 ghost_2/0
ghost_2/1               ghost_smile/0           ghost_smile/1
group/0                 group/1                 group_2/0
group_2/1               men/0                   men/1
mickey/0                mickey/1                open_arm/0
open_arm/1              parent/0                parent/1
robot/0                 robot/1                 skull/0
skull/1                 skull_2/0               skull_2/1
spy/0                   spy/1                   star_smile/0
star_smile/1            team/0                  team/1
travesti/0              travesti/1              user/0
user/1                  user_2/0                user_2/1
user_3/0                user_3/1                user_4/0
user_4/1                user_5/0                user_5/1
user_6/0                user_6/1                user_add/0
user_add/1              user_follow/0           user_follow/1
user_heart/0            user_heart/1            user_location/0
user_location/1         user_received/0         user_received/1
user_received_2/0       user_received_2/1       user_search/0
user_search/1           user_settings/0         user_settings/1
user_shared/0           user_shared/1           user_shared_2/0
user_shared_2/1         user_smile/0            user_smile/1
user_star/0             user_star/1             user_unfollow/0
user_unfollow/1         user_voice/0            user_voice/1
women/0                 women/1
iex(1)> RemixIconEx.User.user
"<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" class=\"icon\">\n  <path d=\"M4 22a8 8 0 1 1 16 0h-2a6 6 0 1 0-12 0H4zm8-9c-3.315 0-6-2.685-6-6s2.685-6 6-6 6 2.685 6 6-2.685 6-6 6zm0-2c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4z\" />\n</svg>\n"
```

The every [RemixIcon topic][1] has its own module.

## Build

First of all, you have to init the [RemixIcon repo][2]

```
$ git submodule init
```

When you are using [asdf][3], you can install all necessary tools by 

```
$ asdf install
```

When you have installed [elixir][4] and [erlang][5], you can build `remix_icon_ex`.

```
$ mix

```

By generating the docs,

```
$ mix docs
```

you can see, how the icons can be used.


[1]: https://remixicon.com/
[2]: https://github.com/Remix-Design/remixicon
[3]: https://github.com/asdf-vm/asdf
[4]: https://github.com/elixir-lang/elixir
[5]: https://github.com/erlang/otp

<!-- MDOC -->

# contact

[hake.one](https://hake.one). Jan Frederik Hake, <jan_hake@gmx.de>. [@enter_haken](https://twitter.com/enter_haken) on Twitter. [enter-haken#7260](https://discord.com) on discord.
