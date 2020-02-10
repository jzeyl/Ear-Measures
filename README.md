# Ear-measures

This set of R scripts automates the calculates various 3D linear measurements, angles, and surface areas from 3D coordinate input in the form of *.fcsv (Slicer) or *.pp (MeshLab). These include angles between a plane of best fit to a point of interests, smallest distance from a point to a plane. The coordinates were taken from microCT scans of ears, but can be applied to other 3D coordinate data. The import of coordinate data and the export of calculated values and computed coordinates are automated. The output extracts 7 landmark coordinates, the angles of interest, and other measurements, and combines this into several unique *.csv files based on the given ID.

In addition, there are scripts to plot wireframe diagrams based on the coordinates using the ‘rgl’ package.

0_input.R Import coordinatesThe inputs are a set of fcsv files from 3D slicer and picked point files (*pp) fromMeshlab. The input/output scripts have a function to search for all the files and subfolders to find the all files of that type

Importing the coordinates and running the calculation scripts:
> Import, calculate and export MASTER.R

Calculation files:

> 1_Tympanic membrane area, EC object coltip 2nd position.R - calculations of tympanic membrane area

> 2_Footplate area.R - calculation of footplate area

> 3_Cochlear aqueduct area.R - calculation of cochlear aqueduct area

> 4_Round window area.R - calculation of round window area

> 5_3D planes of best fit and angles between.R

> 6_Euclid_dist to plane_ EC length_ col length.R

> 7_Plotting the shortest distance from point to plane

> 8_7_TM angles and EC_col angle


Plotting the planes and coordinates as a wireframe diagram:

> plotearauto.R

Combining all measurements and exporting as csv:

> outputs
