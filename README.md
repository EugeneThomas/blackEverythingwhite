<h1><c><b> THE SEEKER </b></c></h1> 

<b> by blackEverythingwhite (Eugene Thomas, Aryan Bhatt, and Jack Cruse-Mulhall)</b>

<i>HOW TO PLAY</i> 
<ul> 
<li>Once you run the processing file, a maze will be generated using the depth-search method for maze-generation.</li>
<li>Then, with a blinded aspect, you will be given thirty seconds to solve the maze (by reaching the exit square). Movement is achieved through the UP, LEFT, DOWN, and RIGHT keys or 'W', 'A', 'S', 'D', respectively.</li>
<li>If you do not complete this in time, you will respawn in the same place and a life will be lost. However, if you are lucky, you will move on to the next round which uses a tree-growing algoritm that is a certain percentage of backtracking and a certain percentage randomized. In the case of level 2, it is 75% backtracking and 25% randomized. After that, the percentage of backtracking decreases by 25 percentage points while the percentage of randomized paths is increased by 25 percentage points. This is until you reach the fifth level which is a fully randomly-generated and checked path via Prim's Algorithm.</li> 
<li>After level 5 (if you happen to make it that far) you will be greeted by two more tree-growing algoritms which you will be asked to solve until you reach level 8, in which you will be greeted with your first example of an Eller's algorithm for maze-generation (which involves subdividing each row into randomized sets and connecting them from there).</li> 
<li>This game is continuous and you die when you lose all three of your lives.</li> 
<li>This game has less of an objective of winning and is more of a challenge and a learning experience of the different kinds of maze generation algorithms.</li> 
</ul> 

<i>HOW TO DRIVE</i> 
<ul> 
<li>Open up your terminal and enter whichever sub-directory you would like to use.</li>
<li>Clone this repo:  <b>git clone git@github.com:EugeneThomas/blackEverythingwhite.git </b></li> 
<li>Move into the given directory:  <b> cd blackEverythingwhite/maze_generator </b> </li> 
<li>Run the processing file:   <b> processing maze_generator.pde & </b> </li> 
<li>Either press <b>Ctrl + r</b> or the play button to run the game.</li> 
<li>Have fun!</li> 
</ul> 
