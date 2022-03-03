# Turntable Traction Drive Project

<image alt="Design Render" src="images/design-render.jpg" width=600 />

This is my design for a Turntable Traction Drive. It's meant to turn a large theatrical turntable covered in sets and actors in a safe reliable way. 

Feel free to make your own or iterate on this in any way. If you do happen to build one, send me a picture, I'd love to share it!

## Media

- PDF: [Parts Overview](TurntableTractionDrive-PartsOverview.pdf)
- Video: [Initial Bench Test](https://youtu.be/k4kjQTp1Dig)
  
  [![Bench Test](video/bench-run-small.gif)](https://youtu.be/k4kjQTp1Dig)

- Video: [Startup Run](https://youtu.be/NJ8Oi7qZh6Y)

  [![Startup Run](video/startup-run-small.gif)](https://youtu.be/NJ8Oi7qZh6Y)

- Video: [Full Speed Run](https://youtu.be/5Oqq8lbxnWo)

  [![Full Speed Run](video/full-speed-run-small.gif)](https://youtu.be/5Oqq8lbxnWo)

## Turntable Traction Drive Specifications

| Traction Drive Feature |  Detail |
| -------------- | ------------------------------|
| Height | 9.875" |
| Width | 32.875" |
| Weight | #UNKNOWN# |
| Number of Parts | #UNKNOWN# |
| Minimum Turntable Size | 7' Diameter |
| Maximum Turntable Size | Proven on a 23' diameter Turntable with steel and wood scenery. |

### Powerplant Details

My motor decision was based on what I had lying around. You may easily sub in your own motor, but for simplicity of integration try to pick a motor matching NEMA Frame 145TC. Otherwise you may have to drill new holes in the `Base Plate` and `Motor Gusset`.

| Motor Feature |  Detail |
| -------------- | ------------------------------|
| Model | General Electric 2HP TEFC (5KE48WN8167) |
| Speed | 1725 RPM at 60Hz |
| Layout | NEMA Frame 145TC |
| Gearhead | Morse 175Q140LR5 |
| Gearhead Ratio | 5:1 |

### Control Details

In order to vary the speed of drive motor we must use a Variable Frequency Drive (VFD). The VFD will be responsible for managing the speed and acceleration of the traction drive. Choosing the right motor controller is therefore key to the reliability and safety of the system. 

| VFD Feature |  Detail |
| -------------- | ------------------------------|
| Model | Hitachi L-100 (L100-007NFU)  |
| Input Power | 120VAC 15A |
| Output Power | 0.75 KW (1 HP) |
| Output Range | 0 - 360Hz |


## Bill Of Materials

I've tried to use off-the-shelf parts as much as possible in order to make this design accessible. 

A Complete Bill Of Materials is available here: [Bill Of Materials](BOM.md)

## Design

Staples Players was looking for a way to add some automation and motion to its production of Disney's Descendants The Musical. I was interested in creating a solution which could be applied generically to any of the typical turntable configurations they use.

I decided to make a drive unit to rotate a turntable by applying a traction wheel against the edge of the table. Such a device would be easy to integrate in most sets where the turntable sits on top of the stage floor.

### Considerations

Using drive wheels to turn a turntable seemed pretty straight forward. I'm pretty sure I've seen carnival rides driven in this manner. As a gut-check I did a bit of marketplace research and found that such devices do exist.

<image alt="Concept" src="images/initial-concept.png" width=600 />

My first idea was to use a motor with a gear reduction and a triangular chain configuration. The friction wheels would be pneumatic tires. The idea was that an idler would pull the chain away from the contact-point of the turntable and allow for easy tensioning of the chain system. However, preliminary research indicated two things: First, chains don't like to be run horizontally they prefer to run vertically. Second, a triangular configuation would result in an uneven distribution of power between the two drive wheels.

<image alt="Design Layout" src="images/design-layout.jpg" width=400 />

Moving away from the triangular configuration I moved towards a centrally mounted motor with two chains, one going to each drive shaft. I also ditched the idea of pneumatic wheels and switch to an off-the-shelf keyed drive roller from McMaster. This simplified sourcing and answered the question: How do I attach the drive shaft to the wheel.

<image alt="Design Render" src="images/design-render.jpg" width=400 />

With those two decisions made the next step was to make a design in Fusion 360 and start selecting components. I started with the motor. I was eager to use a motor I had sitting on the shelf: A 3 Phase 2HP GE Motor (NEMA Frame 145TC. GE Model 5KE48WN8167) with a Morse 5:1 right-angle gear reduction (Morse 175Q140LR5.) This is a fairly beefy motor with a significant gear reduction.

| Component Ratios  | | | |
| -- | ------ | -- | -- |
|    |  Motor Shaft | Gear Box Output | Output Wheel |
| Ratio | 1:1 (1.0) | 5:1 (.20) | 11:30 (.36) |
| RPM @ 60Hz | 1725 RPM | 345 RPM | 124 RPM |

In addition to the gear reduction on the front-end of the motor, I wanted to further reduce the gearing for two reasons: First, turntables typically require a large amount of effort to break free when turning. Reduced gearing would permit greater starting torque. Second, the native speed of the motor and gearing is 345 RPM (1725 RPM / 5). We want the traction drive gearing to allow us to use as much of the 0-60Hz range of the motor as possible without spinning a turntable too quickly. Therefore care was taken to use a small drive sprocket (11 teeth), a large axle-sprocket (30 teeth), and a small drive wheel (6" diameter".)

| Effective Speed Math | |  |
| -- | -- | -- |
| Drive Wheel Circumference (feet) | 2π * .25' | 1.57' Foot Circumference |
| Linear Feet Per Minute | 124 RPM * 1.57' | 194 Feet Per Minute |
| 7' Diameter Turntable Max Speed | 194 FPM ÷ 22' | 8.8 RPM |
| 16' Diameter Turntable Max Speed | 194 FPM ÷ 50' | 3.8 RPM |
| 24' Diameter Turntable Max Speed | 194 FPM ÷ 75' | 2.6 RPM |

**Integration Note:** *If you find that the drive speed is not large enough for your large turntable design, your best bet, depending on your choise of motor and VFD, is to overdrive the motor past 60Hz. (Most VFDs let you run up to 360Hz, but you will want to check your motor and drive documentation first.) Alternatively you could swap out the 6" drive wheels for a larger diameter wheel, but be aware that this will affect the available startup torque.*

<image alt="Right Bearing Gusset" src="images/right-gusset.jpg" width=400 />

It's also worth noting that this machine will sit on the floor. Because of I wasn't going to be able to through-bolt the pillow block bearings. That means that the steel would have to be drilled and tapped, and that I would need additional thickness on the bottom layer in order to have appropriate thread engagement. I've called these parts gussets and there are three of them: Two supporting the lower bearings and one supporting the motor mount.

### Turntable Eccentricity

Turntables aren't perfect circles, and they're not always perfectly centered, so I needed somehow to keep the machine pressed against the side of the turntable even if it's out-of-true. I designed the machine with four 200lb springs which could be set to provide significant preload against the side of the turntable. 

<image alt="Pusher Springs" src="images/pusher-plate.jpg" width=400 />

The springs are held captive by a 5/16" bolt welded to the pusher plate. The springs press against a piece of 1.5" angle iron which is screwed through the two slots to the stage floor. This allows the whole machine to slide back and forth in response to bulges or dips in the circumference of the turntable.

<image alt="Ratchet Straps" src="images/ratchet-straps.jpg" width=400 />

When testing we found that a far simpler solution was to use ratchet straps to draw the machine up against the side of the turntable and hold it there. Ratchet straps have some natural elasticity and therefore provide similar preload to a spring-based solution with substantially easier integration. (We can turn a large turntable witout even bolting the machine to the deck!)

### Chain Tension

Chain based system must be kept in tension to keep the chain from slipping off the drive sprocket. In order to apply tension to the system we mounted the drive motor on top of an adjustable sled from McMaster. However, we noticed too late that the sled is meant to adjust the position of a motor mounted perpendicularly to the track of the sled. My design called for the motor to be mounted parallel with the track.

<image alt="Motor Modifications" src="images/motor-mods.jpg" width=200 />

In order to mount the motor in this orientation we had to drill two additional holes in the motor's NEMA 146TC mounting plate. Once drilled we could use the drive seld to tension the chain and then crank down the motor bolts to lock it in place.

### Material

Because I didn't know how much force would be required to turn a loaded-turntable I wasn't able to do any real load calculations. Without this knowlege it seemed the best bet was to over-build the system. So I designed around plasma-cut 1/4" A36 mild steel.

<image alt="Steel Order" src="images/steel-qa.jpg" width=400 />

I made a tab-and-slot design such that when assembled the machine would (hopefully) hold itself square long enough for me to weld it together. I allowed for 1/16th of clearance between my tabs and my slots and verified that the steel shop could hold 1/16 tolerance during plasma cutting. Their advice was that as long as no holes were smaller than 0.25" they should have no problems holding 1/16" tol.

<image alt="Parts Fitup" src="images/parts-fitup.jpg" width=400 />

Chapin and Bangs in Bridgeport, CT made the steel parts. They were made out of A36 steel, plasma cut, delivered dry. The cost was $810 with delivery.

<image alt="Initial Welds" src="images/initial-welds.jpg" width=400 />

The biggest problem with 1/4" steel is that my welder is only barely powerful enough to weld it. I ended up using .030 flux-core wire. Flux-core welds don't look great but they're plenty strong and I was able to get reasonable penetration even with my wimpy 120VAC welder.


## Assembly

Assembly took two days, with the majority of time being spent drilling and tapping holes. All bolt holes are undersized for 3/8-24 with the idea being that plasma-cut holes are not very accurate so it's better to drill them after the fact and then tap the perfectly drilled holes. This worked fairly well but we broke plenty of bits and taps.

<image alt="Drilling and Tapping" src="images/drilling-tapping.jpg" width=400 />

We found that the steel fit together perfectly on the day it arrived, but on the second day the top plate no longer fit perfectly on the welded-up sides. It seems like everything moved a little bit as it cooled down from being welded and this caused us some difficulty in assembly. Next time around we will weld the whole machine in a single session. Or perhaps keep the top tacked after the bottom is assembled.

<image alt="Right Drive Wheel" src="images/bottom-chain.jpg" width=300 />

The right-angle (Left/Right AKA Top/Bottom) configuration of the gear-reducer allows us to run one sprocket on top and another sprocket on the bottom. This is useful since 7/8" ID sprockets are quite beefy. Too beefy to fit both chains on a single output shaft from the gear-reducer. For the right-hand drive wheel we connected a ANSI #40 chain to an 11 tooth sprocket mounted on the bottom shaft.

<image alt="Left Drive Wheel" src="images/top-chain.jpg" width=400 />

On the left-hand of the machine we ran chain from a sprocket mounted on the top shaft of the gear-reducer. On this machine the chain is a bit too close to the top plate. In our next revision we'll try to lower the motor 1/4" by eliminating the motor gusset.
