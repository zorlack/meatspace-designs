# Turntable Friction Drive Project

## Problem

Staples Players was looking for a way to add some automation and motion to its production of Disney's Descendants The Musical. I was interested in creating a solution which could be applied generically to any of the typical turntable configurations they use.

I decided to make a drive unit to rotate a turntable by applying a friction wheel against the edge of the table. Such a device would be easy to integrate in most sets where the turntable sits on top of the stage floor.

## Design

Using drive wheels to turn a turntable seemed pretty straight forward. I'm pretty sure I've seen carnival rides driven in this manner. As a gut-check I did a bit of marketplace research and found that such devices do exist.

My first idea was to use a motor with a gear reduction and a triangular chain configuration. The friction wheels would be pneumatic tires. The idea was that an idler would pull the chain away from the contact-point of the turntable and allow for easy tensioning of the chain system. However, preliminary research indicated two things: First, chains don't like to be run horizontally they prefer to run vertically. Second, a triangular configuation would result in an uneven distribution of power between the two drive wheels.

Moving away from the triangular configuration I moved towards a centrally mounted motor with two chains, one going to each drive shaft. I also ditched the idea of pneumatic wheels and switch to an off-the-shelf keyed drive roller from McMaster. This simplified sourcing and answered the question: How do I attach the drive shaft to the wheel.

With those two decisions made the next step was to make a design in Fusion 360 and start selecting hardware. I noticed early-on that because the device would sit on the floor, I wasn't going to be able to through-bolt the pillow block bearings. That means that the steel would have to be drilled and tapped, and that I would need additional thickness on the bottom layer in order to have appropriate thread engagement.

## Turntable Eccentricity

Turntables aren't perfect circles, and they're not always perfectly centered, so I needed somehow to keep the machine pressed against the side of the turntable even if it's out-of-true. I designed the machine with four 200lb springs which could be set to provide significant preload against the side of the turntable. But when testing we found that a far simpler solution was to use ratchet straps to draw the machine up against the side of the turntable and hold it there. Ratchet straps have some natural elasticity and therefore provide similar preload to a spring-based solution with substantially easier integration. (We can turn a large turntable witout even bolting the machine to the deck!)

## Chain Tension

Chain based system must be kept in tension to keep the chain from slipping off the drive sprocket. In order to apply tension to the system we mounted the drive motor on top of an adjustable sled from McMaster. However, we noticed too late that the sled is meant to adjust the position of a motor mounted perpendicularly to the track of the sled. My design called for the motor to be mounted parallel with the track. In order to mount the motor in this orientation we had to drill two additional holes in the motor's NEMA 146TC mounting plate. Once drilled we could use the drive seld to tension the chain and then crank down the motor bolts to lock it in place.

## Material

Because I didn't know how much force would be required to turn a loaded-turntable I wasn't able to do any real load calculations. Without this knowlege it seemed the best bet was to over-build the system. So I opted for a design based on plasma-cut 1/4" A36 mild steel.

I made a tab-and-slot design such that when assembled the machine would (hopefully) hold itself square long enough for me to weld it together. I allowed for 1/16th of clearance between my tabs and my slots and verified that the steel show could hold 1/16 tolerance during plasma cutting. Their advice was that as long as no holes were smaller than 0.25" they should have no problems holding 1/16" tol.

The biggest problem with 1/4" steel is that my welder is only barely powerful enough to weld it. I ended up using .030 flux-core wire. Flux-core welds don't look great but they're plenty strong and I was able to get reasonable penetration even with my wimpy 120VAC welder.

## Assembly

Assembly took two days, with the majority of time being spent drilling and tapping holes. All bolt holes are undersized for 3/8-24 with the idea being that plasma-cut holes are not very accurate so it's better to drill them after the fact and then tap the perfectly drilled holes. This worked fairly well but we broke plenty of bits and taps.

We found that the steel fit together perfectly on the day it arrived, but on the second day the top plate no longer fit perfectly on the welded-up sides. It seems like everything moved a little bit as it cooled down from being welded and this caused us some difficulty in assembly. Next time around we will weld the whole machine in a single session. Or perhaps keep the top tacked after the bottom is assembled.
