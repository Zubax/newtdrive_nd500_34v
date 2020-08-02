# Zubax Sadulli

Sadulli is a 500 W integrated drive for unmanned aerial applications that contains a motor and its control electronics
in a compact enclosure.

The main design goal is to create a compact yet sophisticated motor controller that can be integrated with relatively
small BLDC and PMSM motors (about 40-45 mm in diameter) in a single unit.
Such integrated drive is a drop-in replacement of a regular standalone motor.

## Brief specs

- Operating voltage range: 4-8S Li-ion LiCoO<sub>2</sub>, 12-34 V
- Maximum continuous power 500 W
- UAVCAN/CAN interface compatible with the DS-015 drone standard
- Solderless integration

Sadulli consists of two main parts: a COTS motor and the ESC.
This repository contains the ESC hardware source files only.
There are three design variants of the Sadulli drive.
All of them share the same ESC design.

Variant | Motor                 | Propeller diameter [inch] | Propeller pitch [inch] | Optimum thrust [N] | Max thrust [N]  | Mass [g]
------- | --------------------- | ------------------------- | ---------------------- | ------------------ | --------------- | --------
Grosso  | SunnySky V4014        | 17                        | 6.2                    | 15                 | 39              | 207
Piccino | SunnySky V4006        | 15                        | 5.5                    | 7                  | 15              | 128
Nudo    | N/A                   | N/A                       | N/A                    | N/A                | N/A             | 62

Grosso | Piccino | Nudo
--|--|--
<img src="pics/grosso.png" /> | <img src="pics/piccino.png" /> | <img src="pics/nudo.png" />

Sadulli is equipped with a single non-redundant UAVCAN/CAN interface.
The input power is supplied through standard XT30 male connector.
The device can deliver 5V to the UAVCAN/CAN power delivery network if the respective configuration option is enabled.

<p align="center">
<img src="pics/Sadulli connectors drawing.png" alt="grosso"  width = "100%" />
</p>

Under the hood Sadulli represents a construction of three PCBs (excluding Mitochondrik).

<p align="center">
<img src="pics/Sadulli PCB.png" alt="Sadulli PCB"  width = "60%" />
</p>

The main PCB that determines most of Sadulli properties is the power stage PCB.
The power stage is composed from three [BUK9K6R2-40E](https://www.digikey.com/products/en?keywords=1727-7274-1-ND)
MOSFET arrays.

Parameter                                               | Value
------------------------------------------------------- | -------------------
Drain to Source Voltage (V<sub>ds</sub>)                | 40 V
Current - Continuous Drain (I<sub>d</sub>) @ 25°C       | 40 A
R<sub>ds on</sub> (Max) @ I<sub>d</sub>, V<sub>gs</sub> | 6 mOhm @ 25 A, 10 V
Gate Charge (Q<sub>g</sub>) (Max) @ V<sub>gs</sub>      | 35.4 nC @ 10 V

The resistance of the phase current shunts is 3 mOhm.

The bulk capacitor bank is formed with 6
[68µF aluminum electrolytic capacitors](https://www.digikey.com/product-detail/en/w-rth-elektronik/860020673014/732-8860-3-ND/5727097).

The overcurrent protection is configured to trigger at
~47 A using a 1k resistor connected to the `OC_adj` pin (R1 on the connector PCB).

## License

This project is licensed under the terms of [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
