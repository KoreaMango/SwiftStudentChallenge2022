# ♫ SoundBall

## 🎮 Play
- You can set the horizontal and vertical walls with the Object Picker on the top.
- You can set the sound that the wall makes with the Pitch Picker at the top.
- When the ball hits the wall, it outputs the sound applied to the wall.
- Click the first revert button to return the wall created by the stack.
- Press the second reset button to reset the position of the ball.
- The third stop and play button allows the ball to stop and move.


## FrameWork
I used SwiftUI, SpriteKit, and AVFoundation. To implement 2D animation, SpriteKit was used and object movement and collision detection were used. Through AVFoundation, the piano sound is made when the ball and the wall collide.

## Feature
The feature of this app is that you can easily make songs with balls and walls from simple ui to satisfy your eyes and ears. The pitch varies depending on the color of the wall. You can adjust from C3 to F4 through the picker. The ball moves diagonally and can control its movement through the horizontal and vertical walls. To explain the technical part, if you implement Node as Stack and press the Revert button, it disappears in the order of the last node created. (Last In First Out). And when the node of SpriteKit collides, it outputs a sound through AVFoundation.

