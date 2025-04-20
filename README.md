# 🌿 MattsGreenzones

MattsGreenzones is a simple yet powerful green zone addon built for base FiveM — no frameworks or external dependencies required. It lets server owners define safe zones where players can't shoot, take damage, or drive at full speed.

---

## 🚀 Features

- ⚙️ Easy setup – drag-and-drop installation
- 🛡️ Disables shooting and damage inside green zones
- 🚗 Slows down vehicles within green zones
- 📍 Two methods to create zones:
  - Manual coordinates in the config
  - In-game command: `/greenzone (radius)`
- ❌ Commands to remove zones:
  - `/removeGreenzone` – removes the zone you're currently in
  - `/removeAllGreenzones` – deletes all saved custom zones

---
## 🛠 Installation

1. Download or clone this repository.
2. Drop the folder `MattsGreenzones` into your server's `resources` directory.
3. Add the following to your `server.cfg`:

Permissions:
Make sure your desired user group has access to green zone commands by using these ACE permissions:

```cfg
ensure MattsGreenzones

add_ace group.admin greenzone.add allow
add_ace group.admin greenzone.remove allow
```
You can change the permissions to allow other groups to use the commands.

---
## 🔒 Commands:
**/greenzone [radius]** - Creates a green zone at your current location with the specified radius.

**/removeGreenzone** - Deletes the green zone you're currently standing in.

**/removeAllGreenzones** - Removes all currently saved green zones.

Manual Config Setup:
You can also add custom green zones by editing the config file directly and inputting your own coordinates. This gives you full flexibility to create permanent or polygonal green zones tailored to your map.

Support & Suggestions:
If you have ideas for features or run into issues, feel free to open an issue or reach out on Discord.
