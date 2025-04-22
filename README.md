# 🌿 MattsGreenzones

MattsGreenzones is a simple yet powerful green zone addon for base FiveM. It allows server owners to define safe zones where players can’t shoot, take damage, or drive at full speed.  
**This resource requires the `ox_lib` dependency.**

---

## 🚀 Features

- ⚙️ Easy setup – drag-and-drop installation  
- 🛡️ Disables shooting and damage inside green zones  
- 🚗 Slows down vehicles within green zones  
- 📍 Supports polygonal zones for accurate coverage  
- 🗺️ Fully manual configuration for total control

---

## 🛠 Installation

1. Download or clone this repository.  
2. Place the `MattsGreenzones` folder into your server’s `resources` directory.  
3. Add the following to your `server.cfg`:

```cfg
ensure ox_lib
ensure MattsGreenzones
```

Make sure `ox_lib` is installed and starts **before** `MattsGreenzones`.

---

## ⚙️ Zone Configuration

All green zones must be defined manually in the configuration file.

There is **no in-game command** to create zones — you will need to copy coordinates manually and add them to the config.  
This allows for precise setup and permanent green zones tailored to your map.

Polygonal (multi-corner) zones are supported for maximum flexibility.

---

## 📬 Support & Feedback

If you have suggestions or encounter issues, feel free to open an issue on GitHub or reach out via Discord.
