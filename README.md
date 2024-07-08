<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
\usepackage{amsmath}
# induction motor torque X slip curves
This Matlab script generate torque curves for 3 different rotor resistance in function of relative slip for three phase induction motors.
## table of contents
* [Induction motors](#Induction-motors)
	* [Introduction to Three-Phase Induction Motors](#Introduction-to-Three-Phase-Induction-Motors)
		* [basic Principles](#Basic-Principles)
		* [key Components](#Key-Components)
		* [working Principle](#Working-Principle)
	* [rotor slip](#rotor-slip)
	* [equivalent circuit](#equivalent-circuit)
	* [rotor and stator current](#rotor-and-stator-current)
* [how to use this script](#how-to-use-this-script)
* [example](#example)
* [references](#references)

## induction motors
### introduction to Three-Phase Induction Motors

Three-phase induction motors are a cornerstone in the field of electrical engineering, renowned for their robustness, simplicity, and efficiency. These motors are widely used in industrial applications due to their ability to provide reliable and consistent power. 

#### basic Principles

At the heart of a three-phase induction motor is the concept of electromagnetic induction. When a three-phase alternating current (AC) is supplied to the stator windings, it creates a rotating magnetic field. This rotating field induces a current in the rotor, which in turn generates its own magnetic field that interacts with the stator field, causing the rotor to turn. 

#### key Components

1. **Stator**: The stator is the stationary part of the motor, consisting of laminated steel cores with slots that hold the windings. It is responsible for generating the rotating magnetic field when connected to a three-phase power supply.

2. **Rotor**: The rotor is the rotating part of the motor and can be of two types: squirrel-cage and wound. The squirrel-cage rotor is more common due to its simple and rugged construction.

3. **Air Gap**: The air gap between the stator and rotor is crucial as it allows the magnetic field to interact with the rotor, but it is kept as small as possible to maximize efficiency.

#### working Principle

When the three-phase power supply is applied to the stator windings, a rotating magnetic field is produced. This field induces an electromotive force (EMF) in the rotor due to Faraday's law of electromagnetic induction. The induced EMF causes current to flow in the rotor conductors, which generates its own magnetic field. The interaction between the stator's rotating field and the rotor's magnetic field produces torque, causing the rotor to rotate.
> note that this only applies to 3 phase induction motors
## rotor slip
The voltage induced in the rotor of a induction motor depends on the speed of the rotor relative to the magnetic field. Since the behavior of an induction motor depends on the rotor’s voltage and current, it is often more logical to talk about this relative speed. Two terms are commonly used to define the relative motion of the rotor and the magnetic fields. One is slip speed, defined as the difference between synchronous speed and rotor speed: 
$$
n_{slip}=n_{sync}-n_{m}
$$
The other term used to describe the relative motion is slip, which is the relative speed expressed on a per-unit (or percentage) basis:
$$
s=\frac{n_{sync}-n_{m}}{n_{sync}}
$$
or in angular velocity:
$$
s=\frac{\omega_{sync}-\omega_{m}}{\omega_{sync}}
$$
It is possible to express the mechanical speed of the rotor shaft in terms of synchronous speed and slip:
$$
\omega_{m}=(1-s)\omega_{sync}
$$
One of the more common expressions is derived by substituting equations for rotor speed and slip, resulting in:
$$
f_{r}=(n_{sync}-n_{m})\frac{P}{120}
$$

## equivalent circuit
An induction motor relies for its operation on the induction of voltages and currents in its rotor circuit from the stator circuit (transformer action). Because the induction of voltages and currents in the rotor circuit of an induction motor is essentially a transformer operation, the equivalent circuit of an induction motor will turn out to be very similar to the equivalent circuit of a transformer. An induction motor is called a singly excited machine (as opposed to a doubly excited synchronous machine), since power is supplied to only the stator circuit. Because an induction motor does not have an independent field circuit, its model will not contain an internal voltage source such as the internal generated voltage E, in a synchronous machine.

A transformer per-phase equivalent circuit, representing the operation of an induction motor, is shown:
![equivalent circuit per phase](https://i.ibb.co/Jx5ZGWw/Screenshot-116.png)
## rotor and stator current
The stator current can be derived as:
$$
I_{e}=\frac{E_{1}}{(R_{1}+jX_{1})+\frac{(\frac{R_{2}}{S}+jX_{2})jX_{M}}{(\frac{R_{2}}{S}+jX_{2})+jX_{M}}}
$$
>note that E1 is phase voltage

The resulting rotor current can be solved as:
$$
I_{r}=\frac{E_{Lr}}{R_{r}/s + jX_{Lr}}
$$
or as a current divider:
$$
I_{r}=I_{e}(\frac{jX_{M}}{R_{r}/s+jX_{M}+jX_{2}})
$$
To calculate the Thevenin equivalent of the input side of the induction motor equivalent circuit, first open-circuit the terminals at the X’s and find the resulting open-circuit voltage present there. Then, to find the Thevenin impedance, short circuit the phase voltage and find the Zeq seen “looking” into the terminals. The magnitude of the Thevenin voltage Vth is:
$$
V_{TH}=V_{\phi} \frac{X_{M}}{\sqrt{R_{1}^2+(X_{1}+X_{M})^2}}
$$
The equivalent Thevenin impedance can be calculated with:
$$
Z_{TH}=\frac{jX_{M}(R_{1}+jX_{1})}{R_{1}+J(X_{1}+X_{M})}
$$
and finally, the induced torque can be expressed as:
$$
\tau_{ind}=\frac{3	V_{TH}^2R_{2}/S} {\omega_{sync}[(R_{TH}+R_{2}/S)^2+(X_{TH}+X_{2})^2]}
$$
##  how to use this script
You need to enter the following parameters: 

 - r1 = stator resistance (real)
 - x1 = stator reactance (imaginary)
 - r2 = rotor resistance (real)
 - x2 = rotor rectance (imaginary)
 - xm = magnetization reactance (imaginary)
 - v = terminal voltage
 - et = 1 if wired in star or 0 if wired in triangle
 - np = pole number
 - w = if angular velocity is known (RPM)
 - s = if slip is known
 - SoW = if slip is known = 1; if angular velocity is known = 0
 - fe = synchronous frequency
 - pm = not necessary, but mechanical losses (for future development of the script)
 ## example
 The following example had a three phase induction motor with the following parameters:
    r1 = 0.641
    x1 = 1.106i
    r2 = 0.332
    x2 = 0.464i
    xm = 26.3i
    v = 460
    et = 1
    np = 4
    w = 0
    SoW = 0
    s = 0.016
    fe = 60
    pm = 100

output:
![enter image description here](https://i.ibb.co/qCvRLRp/Figure-1.png)
## references
CHAPMAN, Stephen J. Electric Machinery Fundamentals. New York :McGraw-Hill, 2012.


> Written with [StackEdit](https://stackedit.io/).
> <a href="https://www.mathjax.org">
    <img title="Powered by MathJax"
    src="https://www.mathjax.org/badge/badge.gif"
    border="0" alt="Powered by MathJax" />
</a>
