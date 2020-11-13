# Ear-measures

This set of R scripts calculates various 3D linear measurements, angles, and surface areas from 3D coordinate input in the form of *.fcsv (Slicer) or *.pp (MeshLab) files. 

The inputs are 5 files:
1) a *.fcsv file outlining the perimeter of the tympanic membrane with > 20 points
2) a *.fcsv file with 5 coordinates outlining the following landmarks, in this order:
  (1) tip of umbo
  (2) distal tip of columella
  (3) tip of suprastapedius
  (4) tip of infrastapedius
  (5) tip of endosseous cochlear duct length
3) a *.pp file from MeshLab outlining the perimeter of the footplate > 20 points
4) a *.fcsv file outlining the perimeter of the round window with > 20 points
5)a *.fcsv file outlining the perimeter of the cochlear aqueduct with > 20 points

The outputs are:

3 csv files with 
(1) the computed values, 

Computed values:
1	Height of tympanic membrane protrusion	(Middle ear),
2	Distance from columella to tympanic membrane base plane	(Middle ear),
3	Extrastapedius length	(Middle ear),
4	Columella length	(Middle ear),
5	Angle of tympanic membrane	(Middle ear),
6	Angle between footplate and tympanic membrane	(Middle ear),
7	Angle between the columella and the extracolumella	(Middle ear),
8	Tympanic membrane area	(Middle ear),
9	Footplate area	(Middle ear),
10	Length of endosseous cochlear duct	(Inner ear),
11	Cochlear aqueduct area	(Inner ear),
12	Round window area	(Inner ear)
(2) tympanic membrane angles, and 
(3) the coordinates used for calculations. In addition, there are scripts to plot wireframe diagrams based on the coordinates using the ‘rgl’ package.
(4) wireframe plots
(4) fcsv and stle files of the wireframe plots


Script for importing the coordinates and running the calculation scripts:
> Import, calculate and export MASTER.R

Example input coordinates are in the 'Input' folder. The inputs are a set of *.fcsv files from 3D slicer and picked point files (*pp) fromMeshlab.  These are separate files for the tympanic membrane (TM), extracolumella (EC), round window (RW), cochlear aqueduct (CA) and footplate (FP).

Calculation scripts:

> 1_Tympanic membrane area, EC object coltip 2nd position.R - calculations of tympanic membrane area

> 2_Footplate area.R - calculation of footplate area

> 3_Cochlear aqueduct area.R - calculation of cochlear aqueduct area

> 4_Round window area.R - calculation of round window area

> 5_3D planes of best fit and angles between.R - calculation of planes of best fit for the base of the tympanic membrane and the columella footplate, and the angle between these two planes

> 6_Euclid_dist to plane_ EC length_ col length.R - various 3D distance measurements

> 7_Plotting the shortest distance from point to plane - calculations for plotting the shortest distance form a point to a plane

> 8_TM angles and EC_col angle - calculation of angles of the tympanic membrane




File for plotting the planes and coordinates as a wireframe diagram:

> plotearauto.R

![alt text](Capture.PNG)

File for combining all measurements and exporting as csv:

> outputs.R

Outputs are (1) csv with all the calculated values, (2) csv file with the angles of calculated for the tympanic membrane perimeter, (3) a coordinates file with all of the curve coordinates and computed landmarks (e.g. centroids)
