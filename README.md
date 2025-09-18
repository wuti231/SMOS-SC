Referene:

Bai, Y., Jia, L., Zhao, T., Peng, Z. (2025). SMOS gap-free daily soil moisture product using MTMA (2010-2020). National Tibetan Plateau / Third Pole Environment Data Center.

Bai, Y., Zhao, T., Jia, L., et al. (2022). A multi-temporal and multi-angular approach for systematically retrieving soil moisture and vegetation optical depth from SMOS data. Remote Sensing of Environment. 280, 113190.



DCT_PLS_SM Executable

(1) Prerequisites for Deployment 

Verify that MATLAB Runtime(R2024b) is installed.   
If not, you can run the MATLAB Runtime installer.
To find its location, enter
  
    >>mcrinstaller
      
at the MATLAB prompt.
NOTE: You will need administrator rights to run the MATLAB Runtime installer. 

Alternatively, download and install the Windows version of the MATLAB Runtime for R2024b 
from the following link on the MathWorks website:

    https://www.mathworks.com/products/compiler/mcr/index.html
   
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see 
"Distribute Applications" in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.




(2) MATLAB calling method 

The  SMOS-SC soil moisture product can be obtained from the SMOS_SM product (Bai, et al, 2022) by “DCT_PLS_SM.exe” .

For example, the input data (SMOS_SM product) is a long time series three-dimensional array (M * N * D, where M represents rows, N represents columns, and D represents the number of consecutive days), then users can call the executable program with the following command:

% Set path parameters
lat_lon_path = ' ';
mask_path = ' ';
input_path = ' ';
output_path = ' ';

% Call executable program
system(['DCT_PLS_SM.exe ' lat_lon_path ' ' mask_path ' ' input_path ' ' output_path]).

The output file format of “DCT_PLS_SM.exe” is NC and in the projection of EASE-GRID 2.0, users can read it with the script named “read_plot_smos_sc_sm.m”.
