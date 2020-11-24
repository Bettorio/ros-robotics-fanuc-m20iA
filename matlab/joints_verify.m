%
% -------------------------------------------------------------------
% This script has been developed as an exercise for Robotics course
% @ UniSa.
%
% Title:   joints_verifiy.m
% Author:  Vittorio Fina
% Date:    Nov 23, 2020
%
% This script takes care of calculating the homogeneous transformation 
% matrices relative to fanuc-m20iA following the Denavit-Hartenberg 
% parameters and obtains:
% - Rotation matrices
% - Translation Vectors
% - Euler Angles
% - Axis/Angle
% -------------------------------------------------------------------
%

% Define variables
teta1 = input('Insert teta1 > ');
teta2 = input('Insert teta2 > ');
teta3 = input('Insert teta3 > ');
teta4 = input('Insert teta4 > ');
teta5 = input('Insert teta5 > ');
teta6 = input('Insert teta6 > ');

% Define Homogenous Matrix
A_1_0 = [cos(teta1) 0 -sin(teta1) (0.15 * cos(teta1)); sin(teta1) 0 cos(teta1) (0.15 * sin(teta1)); 0 -1 0 0.525; 0 0 0 1];
A_2_1 = [cos(teta2) -sin(teta2) 0 (0.79 * cos(teta2)); sin(teta2) cos(teta2) 0 (0.79 * sin(teta2)); 0 0 1 0; 0 0 0 1];
A_3_2 = [cos(teta3) 0 -sin(teta3) (0.15 * cos(teta3)); sin(teta3) 0 cos(teta3) (0.15 * sin(teta3)); 0 -1 0 0; 0 0 0 1];
A_4_3 = [cos(teta4) 0 sin(teta4) 0; sin(teta4) 0 -cos(teta4) 0; 0 1 0 0.86; 0 0 0 1];
A_5_4 = [cos(teta5) 0 -sin(teta5) 0; sin(teta5) 0 cos(teta5) 0; 0 -1 0 0; 0 0 0 1];
A_6_5 = [cos(teta6) -sin(teta6) 0 0; sin(teta6) cos(teta6) 0 0; 0 0 1 0.1; 0 0 0 1];
disp('Generated Homogenous Matrix!')

% Define Transformations to the end-effector
A_6_0 = A_1_0 * A_2_1 * A_3_2 * A_4_3 * A_5_4 * A_6_5;
A_6_1 = A_2_1 * A_3_2 * A_4_3 * A_5_4 * A_6_5;
A_6_2 = A_3_2 * A_4_3 * A_5_4 * A_6_5;
A_6_3 = A_4_3 * A_5_4 * A_6_5;
A_6_4 = A_5_4 * A_6_5;
% A_6_5 = A_6_5; Already Assigned
disp('Generated Transformations to the end-effector!')

% Define Rotation Matrix
rotm_0 = tform2rotm(A_6_0);
rotm_1 = tform2rotm(A_6_1);
rotm_2 = tform2rotm(A_6_2);
rotm_3 = tform2rotm(A_6_3);
rotm_4 = tform2rotm(A_6_4);
rotm_5 = tform2rotm(A_6_5);
disp('Generated Rotation Matrix!')

% Define Translation Vector
trvec_0 = tform2trvec(A_6_0);
trvec_1 = tform2trvec(A_6_1);
trvec_2 = tform2trvec(A_6_2);
trvec_3 = tform2trvec(A_6_3);
trvec_4 = tform2trvec(A_6_4);
trvec_5 = tform2trvec(A_6_5);
disp('Generated Translation Vector!')

% Define Euler Angles
eul_0 = rotm2eul(rotm_0);
eul_1 = rotm2eul(rotm_1);
eul_2 = rotm2eul(rotm_2);
eul_3 = rotm2eul(rotm_3);
eul_4 = rotm2eul(rotm_4);
eul_5 = rotm2eul(rotm_5);
disp('Generated Euler Angles!')

% Define Axis/Angle
axang_0 = rotm2axang(rotm_0);
axang_1 = rotm2axang(rotm_1);
axang_2 = rotm2axang(rotm_2);
axang_3 = rotm2axang(rotm_3);
axang_4 = rotm2axang(rotm_4);
axang_5 = rotm2axang(rotm_5);
disp('Generated Axis/Angle!')
