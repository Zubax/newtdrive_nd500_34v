Sadulli is a 500 W integrated drive for unmanned aerial applications that contains a motor and its control electronics in a compact enclosure. 

- Voltage range: 4S-8S Li-Po battery (15V-34V)
- Maximum continuous power 500 W 

Sadulli consists of two main parts:  COTS motor and the ESC.  This repository contains the ESC hardware source files only.  There are three design variants of the Sadulli drive. All of them share the same ESC design.

| Variant | Motor                                                        | Propeller type | Optimum thrust (kg) | Max thrust (kg) | Mass (g) |
| ------- | ------------------------------------------------------------ | -------------- | ------------------- | --------------- | -------- |
| Grosso  | [V4014](http://en.rcsunnysky.com/v-multi-rotorefficiencytype/1083.html) | 17*62          | 1.5                 | 4               | 207      |
| Piccino | [V4006](http://en.rcsunnysky.com/v-multi-rotorefficiencytype/1081.html) | 15*55          | 0.7                 | 1.5             | 128      |
| Nudo    | N/A                                                          | N/A            | N/A                 | N/A             | 62       |

<img src="pics/nudo.png" alt="nudo" style="zoom: 33%;" />

<img src="pics/piccino.png" alt="piccino" style="zoom: 50%;" />

<img src="pics/grosso.png" alt="grosso" style="zoom:60%;" />

Sadulli is equipped with one CAN bus. The power is supplied through XT30 male connector.

<img src="pics/Sadulli connectors drawing.png" alt="grosso" style="zoom:60%;" />

Under the hood Sadulli is made as a construction of three PCBs (excluding Mitochondrik)

<img src="pics/Sadulli PCB.png" alt="grosso" style="zoom:60%;" />

The main PCB that determines most of SADULLI properties is the power stage PCB. The power stage is composed from three [BUK9K6R2-40E](https://www.digikey.com/products/en?keywords=1727-7274-1-ND) MOSFET arrays. 

| Parameter                              | Value            |
| :------------------------------------- | ---------------- |
| Drain to Source Voltage (Vdss)         | 40V              |
| Current - Continuous Drain (Id) @ 25°C | 40A              |
| Rds On (Max) @ Id, Vgs                 | 6mOhm @ 25A, 10V |
| Gate Charge (Qg) (Max) @ Vgs           | 35.4nC @ 10V     |

Current shunt value is 3 mOhm

Bulk capacitor bank is formed with 6 [68µF  aluminum electrolytic capacitors](https://www.digikey.com/product-detail/en/w-rth-elektronik/860020673014/732-8860-3-ND/5727097) from Würth

## License

This project is licensed under the terms of [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/).
