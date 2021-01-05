# Zubax Sadulli V1 manufacturing instructions

Prior to starting the assembly make sure that all the items from the list below are present.

Item                          | Amount| Part number                                                     | Description
------------------------------|-------|-----------------------------------------------------------------|-------------------------------------------------------
Motor                         | 1     | Sunnysky V4006/V4014                                            | BLDC motor. V4006 for Piccino, V4014 for Grosso.
Housing top                   | 1     |                                                                 | Milled from aluminum.
Housing bottom                | 1     |                                                                 | Milled from aluminum.
Housing screw                 | 4     | DIN 965 20 mm                                                   | Fastening both parts of the housing together.
Motor screw                   | 4     | DIN 7984 4 mm                                                   | Fastening the motor to the top part of the housing.
Thermal pad                   | Dia 42 mm | Arctic Cooling ACTPD00018A, ACTPD00005A, or ACTPD00002A     | Sinks the heat to the bottom part of the housing.
Connectors PCB                | 1     |                                                                 |
Logic PCB                     | 1     |                                                                 |
Power stage PCB               | 1     |                                                                 |
Thermistor                    | 1     | KTY84/130, KTY81/120, or KTY83/130                              | PTC thermistor with pre-soldered extension wires.

![](BOM.png)

The motor should be slightly modified to assemble the device:

* Phase wires should be rerouted straight down and trimmed to ~30-35 mm (measuring from the bottom of the motor).
The ends of the wires (3-5 mm) should be tinned.

* Two pieces of thin wires (0.3-0.6 mm dia) should be soldered to the thermistor prior to its installataion.
The wires' length should be ~35-45 mm. The ends of the wires (3-5 mm) should be tinned.

* The thermistor should be glued directly to the motor windings with epoxy resin
(care must be taken to avoid ingress of epoxy into the motor bearing).

The thermal pad has the shape of a circle with a diameter of 40-42 mm, 1 mm thickness.

For the detailed assembly process of Sadulli v1.0 please check the video: https://youtu.be/bqTBei1wUUw
