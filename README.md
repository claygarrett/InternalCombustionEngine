# Internal Cumbustion Engine

Things i need to model:

Piston
Piston Rod
Crankshaft/Cranks (and its connection points to piston rods?)
Camshaft/cams
Intake / Exhaust valves
Valve Cams (how are these driven)
Sparkplug
Fuel/Air/Fuel Injector
Combustion
Compression

## Stroke Phases:
• Intake/Induction/Suction
• Compression
• Power/Working
• Exhaust

Later:
Flywheel
Gearbox

Ratio of Crank to Camshaft is 2:1 -- takes 2 revolutions of camshaft for 1 revolution of camshaft Takes 2 
Crank counterweights provides momentum 

Combustion Pressure measured in bars (e.g. 180 bar)

## Firing Order

### Stroke 1:
Piston 1: Intake: 270° Exhaust: 180°: *Intake (1)*
Piston 2: Intake: 180° Exhaust: 90°: *Compression (2)*
Piston 3: Intake: 90° Exhaust: 0° *Exhaust (4)*
Piston 4: Intake: 0° Exhaust: 270° *Power (3)*


### Stroke 2:
Piston 1: Intake: 180° Exhaust: 90°: *Compression (2)*
Piston 2: Intake:0° Exhaust: 270° *Power (3)*
Piston 3: Intake: 270° Exhaust: 180° *Intake (1)*
Piston 4: Intake: 90° Exhaust: 0° *Exhaust (4)*


### Stroke 3:
Piston 1: Intake: 0° Exhaust: 270° *Power (3)*
Piston 2: Intake: 90° Exhaust: 0° *Exhaust (4)*
Piston 3: Intake: 180° Exhaust: 90°: *Compression (2)*
Piston 4: Intake: 270° Exhaust: 180° *Intake (1)*


### Stroke 4:
Piston 1: Intake: 90° Exhaust: 0° *Exhaust (4)*
Piston 2: Intake: 270° Exhaust: 280° *Intake (1)*
Piston 3: Intake: 0° Exhaust: 270° *Power (3)*
Piston 4: Intake: 180° Exhaust: 90°: *Compression (2)*


Intake Camshaft: 270 (down), 180, 90, 0
Exhaust Camshaft: 180 (down), 90, 0, 270

# Ownership
Crankshaft
*Crank Sprocket*
Flywheel
Timing Belt
Intake Camshaft
Cams 1-4
Exhaust Camshaft
Cams 1-4
Sparkplugs 1-4
Rod Bearings
Piston Rod
Piston
Intake Valve
Exhaust Valve
Intake Manifold
Exhaust Manifold


Piston
Piston Rod
Crankshaft/Cranks (and its connection points to piston rods?)
Camshaft/cams
Intake / Exhaust valves
Valve Cams (how are these driven)
Sparkplug
Fuel/Air/Fuel Injector
Combustion
Compression
