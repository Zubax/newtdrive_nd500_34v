# Zubax Sadulli

Sadulli is an open-hardware reference design of a 500 W integrated propeller drive based on the
[Mitochondrik LV](http://zubax.com/mitochondrik-lv) motor control chip.
It includes a motor and its control electronics in a single compact unit.

The main design goal is to create a compact yet sophisticated motor controller that can be integrated with relatively
small BLDC and PMSM motors (about 40-45 mm in diameter) in a single unit.
Being equipped with a standard mounting hole pattern,
Sadulli can be used as a drop-in replacement for regular standalone motors in various UAV applications.

## Specifications

- Operating voltage range: 4-8S Li-ion LiCoO<sub>2</sub>, 11-34 V
- Maximum continuous power 500 W
- [Cyphal](https://telega.zubax.com/)/CAN (formerly UAVCAN) interface compatible with the DS-015 drone standard
- Solderless integration

Sadulli consists of two main parts: a COTS motor and the ESC.
This repository contains the ESC hardware source files only.
There are two design variants of the Sadulli drive.
All of them share the same ESC design.

Variant  | Motor                 | Propeller diameter [inch] | Propeller pitch [inch] | Mass [g]
-------- | --------------------- | ------------------------- | ---------------------- | --------
Alakdan  | Scorpion MII-4010     | 17                        | 6.2                    | 193
Nudo     | N/A                   | N/A                       | N/A                    | 62

Alakdan | Nudo
--|--
<img src="figures/alakdan.png" width="743"/> | <img src="figures/nudo.png" />

Sadulli is equipped with a single non-redundant Cyphal/CAN interface.
The input power is supplied through a standard XT30 male connector.
The device can deliver 5V to the Cyphal/CAN power delivery network if the respective configuration option is enabled.

<img src="figures/Sadulli connectors drawing.png" />

Under the hood, Sadulli is a construction of three PCBs (excluding the Mitochondrik).

<p align="center">
<img src="figures/Sadulli PCB.png" alt="Sadulli PCB"  width="60%" />
</p>

The main PCB that determines most of Sadulli's properties is the power stage PCB.
The power stage is composed of three [BUK9K6R2-40E](https://www.digikey.com/products/en?keywords=1727-7274-1-ND)
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

### Telega configuration

The Mitochondrik LV module installed in Sadulli needs to be configured such that it is aware of the parameters of the power stage
(and the motor).
To achieve this, upload the following configuration:

```yaml
# Refer to the Mitochondrik-LV datasheet for the explanation of how the parameter values have been found.
vsi.bridge_resistance:    [0.003, 0.006, 0.003, 0.006, 0.003, 0.003]                            # [ohm]
vsi.phase_current_gain:   [33.333333333333, 33.333333333333, 8.333333333333, 8.333333333333]    # [ampere/volt]
vsi.phase_current_stderr: [0.2, 0.2, 0.1, 0.1]                                                  # [ampere]
vsi.thermistor_v2k:       [223.15, 100.0, 0.0]                                                  # for MCP9700

motor.current_ctl_bwr:  0.04
motor.current_max:      38.0
motor.mechanical_ratio: 7                   # The motor has 14 poles.
motor.inductance_dq:    [29.0e-6, 29.0e-6]
motor.resistance:       0.0508
motor.flux_linkage:     0.002115
motor.current_ramp:     5000.0
motor.voltage_ramp:     20.0
# The thermistor coefficients are valid for:
# R_pull = 1.2 kohms; R_io = 0; V_pull = 3.3 V
# Thermistor models: KTY81/120, KTY81/110, KTY81/121, KTY81/122, KTY81/150, 102PS1J, 102PS1G.
motor.thermistor_v2k: [151.24172662, 36.46076996, 40.65372514]

aux.pull: +1                    # Pull up the thermistor input.

sys.debug: false                # Turn off the in-circuit debug interfaces to enhance EMI immunity.
sys.golden: sys. vsi. motor. aux.pull # Retain these parameter groups across a factory reset.
```

Refer to the Telega Reference Manual for details.

## Release notes

### Sadulli v1.5 (May 2023)

* Added Alakdan variant using Scorpion MII-4010 motor.
* Removed Grosso and Piccino variants using SunnySky motors.
* Updated assembly guide.
* Increased the hardware over-current protection limit (R1 on the connectors PCB increased to 27k).
* Added thermistor alternatives:

Original  | Alternatives
--------- | -----------------
KTY81/120 | KTY81/110, KTY81/121, KTY81/122, KTY81/150, 102PS1J, 102PS1G

### Sadulli v1.0 (January 2021)

First stable release. There have been no substantial changes compared to the pre-production revision.

## License

This project is licensed under the terms of [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).
