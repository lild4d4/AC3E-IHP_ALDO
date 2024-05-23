# LDO - Design example for IHP - Open Source PDK.

> © Daniel Arevalos, Innovations for High Performance Microelectronics (IHP).

This is a design made as an example for the IHP-Open-PDK technology.

![](docs/source/fig/LDO_AC3E_nofill.png)

### Directory Structure

```
├─ 📁 klayout
├─ 📁 xschem
├─ 📁 python
├─ 📁 results
└─ 📄Makefile.mk
```

### Overview

The design consist in:

1. LDO_Closed-loop: low dropout regulator with feedback loop 
2. LDO_Open-loop: low dropout regulator with the feedback loop opened.
3. Pass transistor: The pass transistor used in the LDO. 
4. OTA Open-Loop: Two stage Transconductance amplifier used in the LDO design.
5. TGATE1: transmission gate for testing.
6. TGATE2: transmission gate for testing. 

<img src="docs/source/fig/LDO_AC3E_designs.png" width="500">




