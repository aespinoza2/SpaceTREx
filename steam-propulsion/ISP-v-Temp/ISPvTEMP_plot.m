% Inputs
DH_burn = 285800; % J/mol 
Cp_steam = 1996; % J/(kg K)
H2O_molecular_mass = 0.018; % kg/mol
Temp_init = 293; % Kelvin
G_earth = 9.806 % m/s2

% Standard State Enthalpies
H2O_sse = -251730; % J/mol
HO_sse = 30150; % J/mol
H_sse = 211782; % J/mol
O_sse = 242459; % J/mol
H2_sse = -8468; % J/mol
O2_sse = -8682; % J/mol

% Molecular Weight
H2O_mw = 18.016; % g/mol
HO_mw = 17.0007; % g/mol
H_mw = 1.008; % g/mol
O_mw = 16; % g/mol
H2_mw = 2.016; % g/mol
O2_mw = 31.999; % g/mol

% Import Mass Fractions Table
MF_matrix = csvread("mass_fract.csv");

% Create Temperature Array
Temp = [1000 1500 2000 2500 3000 3500 4000 4500];

% Component Mole Quantities at 1000 K
H2O_molqt_1000 = ((MF_matrix(1,2))*H2O_mw)/H2O_mw;
HO_molqt_1000 = ((MF_matrix(1,3))*H2O_mw)/HO_mw;
H_molqt_1000 = ((MF_matrix(1,4))*H2O_mw)/H_mw; 
O_molqt_1000 = ((MF_matrix(1,5))*H2O_mw)/O_mw;
H2_molqt_1000 = ((MF_matrix(1,6))*H2O_mw)/H2_mw;
O2_molqt_1000 = ((MF_matrix(1,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 1500 K
H2O_molqt_1500 = ((MF_matrix(2,2))*H2O_mw)/H2O_mw;
HO_molqt_1500 = ((MF_matrix(2,3))*H2O_mw)/HO_mw;
H_molqt_1500 = ((MF_matrix(2,4))*H2O_mw)/H_mw;
O_molqt_1500 = ((MF_matrix(2,5))*H2O_mw)/O_mw;
H2_molqt_1500 = ((MF_matrix(2,6))*H2O_mw)/H2_mw;
O2_molqt_1500 = ((MF_matrix(2,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 2000 K
H2O_molqt_2000 = ((MF_matrix(3,2))*H2O_mw)/H2O_mw;
HO_molqt_2000 = ((MF_matrix(3,3))*H2O_mw)/HO_mw;
H_molqt_2000 = ((MF_matrix(3,4))*H2O_mw)/H_mw;
O_molqt_2000 = ((MF_matrix(3,5))*H2O_mw)/O_mw;
H2_molqt_2000 = ((MF_matrix(3,6))*H2O_mw)/H2_mw;
O2_molqt_2000 = ((MF_matrix(3,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 2500 K
H2O_molqt_2500 = ((MF_matrix(4,2))*H2O_mw)/H2O_mw;
HO_molqt_2500 = ((MF_matrix(4,3))*H2O_mw)/HO_mw;
H_molqt_2500 = ((MF_matrix(4,4))*H2O_mw)/H_mw;
O_molqt_2500 = ((MF_matrix(4,5))*H2O_mw)/O_mw;
H2_molqt_2500 = ((MF_matrix(4,6))*H2O_mw)/H2_mw;
O2_molqt_2500 = ((MF_matrix(4,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 3000 K
H2O_molqt_3000 = ((MF_matrix(5,2))*H2O_mw)/H2O_mw;
HO_molqt_3000 = ((MF_matrix(5,3))*H2O_mw)/HO_mw;
H_molqt_3000 = ((MF_matrix(5,4))*H2O_mw)/H_mw;
O_molqt_3000 = ((MF_matrix(5,5))*H2O_mw)/O_mw;
H2_molqt_3000 = ((MF_matrix(5,6))*H2O_mw)/H2_mw;
O2_molqt_3000 = ((MF_matrix(5,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 3500 K
H2O_molqt_3500 = ((MF_matrix(6,2))*H2O_mw)/H2O_mw;
HO_molqt_3500 = ((MF_matrix(6,3))*H2O_mw)/HO_mw;
H_molqt_3500 = ((MF_matrix(6,4))*H2O_mw)/H_mw;
O_molqt_3500 = ((MF_matrix(6,5))*H2O_mw)/O_mw;
H2_molqt_3500 = ((MF_matrix(6,6))*H2O_mw)/H2_mw;
O2_molqt_3500 = ((MF_matrix(6,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 4000 K
H2O_molqt_4000 = ((MF_matrix(7,2))*H2O_mw)/H2O_mw;
HO_molqt_4000 = ((MF_matrix(7,3))*H2O_mw)/HO_mw;
H_molqt_4000 = ((MF_matrix(7,4))*H2O_mw)/H_mw;
O_molqt_4000 = ((MF_matrix(7,5))*H2O_mw)/O_mw;
H2_molqt_4000 = ((MF_matrix(7,6))*H2O_mw)/H2_mw;
O2_molqt_4000 = ((MF_matrix(7,7))*H2O_mw)/O2_mw;

% Component Mole Quantities at 4500 K
H2O_molqt_4500 = ((MF_matrix(8,2))*H2O_mw)/H2O_mw;
HO_molqt_4500 = ((MF_matrix(8,3))*H2O_mw)/HO_mw;
H_molqt_4500 = ((MF_matrix(8,4))*H2O_mw)/H_mw;
O_molqt_4500 = ((MF_matrix(8,5))*H2O_mw)/O_mw;
H2_molqt_4500 = ((MF_matrix(8,6))*H2O_mw)/H2_mw;
O2_molqt_4500 = ((MF_matrix(8,7))*H2O_mw)/O2_mw;

% Create Component Mole Quantity Rows for Matrix
MOLQT_matrix_r1 = [Temp(1) H2O_molqt_1000 HO_molqt_1000 H_molqt_1000 O_molqt_1000 H2_molqt_1000 O2_molqt_1000];
MOLQT_matrix_r2 = [Temp(2) H2O_molqt_1500 HO_molqt_1500 H_molqt_1500 O_molqt_1500 H2_molqt_1500 O2_molqt_1500];
MOLQT_matrix_r3 = [Temp(3) H2O_molqt_2000 HO_molqt_2000 H_molqt_2000 O_molqt_2000 H2_molqt_2000 O2_molqt_2000];
MOLQT_matrix_r4 = [Temp(4) H2O_molqt_2500 HO_molqt_2500 H_molqt_2500 O_molqt_2500 H2_molqt_2500 O2_molqt_2500];
MOLQT_matrix_r5 = [Temp(5) H2O_molqt_3000 HO_molqt_3000 H_molqt_3000 O_molqt_3000 H2_molqt_3000 O2_molqt_3000];
MOLQT_matrix_r6 = [Temp(6) H2O_molqt_3500 HO_molqt_3500 H_molqt_3500 O_molqt_3500 H2_molqt_3500 O2_molqt_3500];
MOLQT_matrix_r7 = [Temp(7) H2O_molqt_4000 HO_molqt_4000 H_molqt_4000 O_molqt_4000 H2_molqt_4000 O2_molqt_4000];
MOLQT_matrix_r8 = [Temp(8) H2O_molqt_4500 HO_molqt_4500 H_molqt_4500 O_molqt_4500 H2_molqt_4500 O2_molqt_4500];

% Create Component Mole Quantity Matrix
MOLQT_matrix = [MOLQT_matrix_r1; MOLQT_matrix_r2; MOLQT_matrix_r3; MOLQT_matrix_r4; MOLQT_matrix_r5; MOLQT_matrix_r6; MOLQT_matrix_r7; MOLQT_matrix_r8];

% Initial Heat Transfer of Chemical Reaction
DH_init_1000 = Cp_steam * H2O_molecular_mass * (Temp(1) - Temp_init);
DH_init_1500 = Cp_steam * H2O_molecular_mass * (Temp(2) - Temp_init);
DH_init_2000 = Cp_steam * H2O_molecular_mass * (Temp(3) - Temp_init);
DH_init_2500 = Cp_steam * H2O_molecular_mass * (Temp(4) - Temp_init);
DH_init_3000 = Cp_steam * H2O_molecular_mass * (Temp(5) - Temp_init);
DH_init_3500 = Cp_steam * H2O_molecular_mass * (Temp(6) - Temp_init);
DH_init_4000 = Cp_steam * H2O_molecular_mass * (Temp(7) - Temp_init);
DH_init_4500 = Cp_steam * H2O_molecular_mass * (Temp(8) - Temp_init);

% Heat Transfer form Burn of Oxygen and Hydrogen in Nozzle
DH_burn_1000 = ((H2O_sse * H2O_molqt_1000) + (HO_sse * HO_molqt_1000) + (H_sse * H_molqt_1000) + (O_sse * O_molqt_1000) + (H2_sse * H2_molqt_1000) + (O2_sse * O2_molqt_1000)) - H2O_sse;
DH_burn_1500 = ((H2O_sse * H2O_molqt_1500) + (HO_sse * HO_molqt_1500) + (H_sse * H_molqt_1500) + (O_sse * O_molqt_1500) + (H2_sse * H2_molqt_1500) + (O2_sse * O2_molqt_1500)) - H2O_sse;
DH_burn_2000 = ((H2O_sse * H2O_molqt_2000) + (HO_sse * HO_molqt_2000) + (H_sse * H_molqt_2000) + (O_sse * O_molqt_2000) + (H2_sse * H2_molqt_2000) + (O2_sse * O2_molqt_2000)) - H2O_sse;
DH_burn_2500 = ((H2O_sse * H2O_molqt_2500) + (HO_sse * HO_molqt_2500) + (H_sse * H_molqt_2500) + (O_sse * O_molqt_2500) + (H2_sse * H2_molqt_2500) + (O2_sse * O2_molqt_2500)) - H2O_sse;
DH_burn_3000 = ((H2O_sse * H2O_molqt_3000) + (HO_sse * HO_molqt_3000) + (H_sse * H_molqt_3000) + (O_sse * O_molqt_3000) + (H2_sse * H2_molqt_3000) + (O2_sse * O2_molqt_3000)) - H2O_sse;
DH_burn_3500 = ((H2O_sse * H2O_molqt_3500) + (HO_sse * HO_molqt_3500) + (H_sse * H_molqt_3500) + (O_sse * O_molqt_3500) + (H2_sse * H2_molqt_3500) + (O2_sse * O2_molqt_3500)) - H2O_sse;
DH_burn_4000 = ((H2O_sse * H2O_molqt_4000) + (HO_sse * HO_molqt_4000) + (H_sse * H_molqt_4000) + (O_sse * O_molqt_4000) + (H2_sse * H2_molqt_4000) + (O2_sse * O2_molqt_4000)) - H2O_sse;
DH_burn_4500 = ((H2O_sse * H2O_molqt_4500) + (HO_sse * HO_molqt_4500) + (H_sse * H_molqt_4500) + (O_sse * O_molqt_4500) + (H2_sse * H2_molqt_4500) + (O2_sse * O2_molqt_4500)) - H2O_sse;

% Total Heat Transfer [J/mol]
DH_total_1000 = DH_init_1000 + DH_burn_1000;
DH_total_1500 = DH_init_1500 + DH_burn_1500;
DH_total_2000 = DH_init_2000 + DH_burn_2000;
DH_total_2500 = DH_init_2500 + DH_burn_2500;
DH_total_3000 = DH_init_3000 + DH_burn_3000;
DH_total_3500 = DH_init_3500 + DH_burn_3500;
DH_total_4000 = DH_init_4000 + DH_burn_4000;
DH_total_4500 = DH_init_4500 + DH_burn_4500;

% Total Heat Transfer [J/kg]
DH_total_pkg_1000 = DH_total_1000 / H2O_molecular_mass;
DH_total_pkg_1500 = DH_total_1500 / H2O_molecular_mass;
DH_total_pkg_2000 = DH_total_2000 / H2O_molecular_mass;
DH_total_pkg_2500 = DH_total_2500 / H2O_molecular_mass;
DH_total_pkg_3000 = DH_total_3000 / H2O_molecular_mass;
DH_total_pkg_3500 = DH_total_3500 / H2O_molecular_mass;
DH_total_pkg_4000 = DH_total_4000 / H2O_molecular_mass;
DH_total_pkg_4500 = DH_total_4500 / H2O_molecular_mass

% ISP Calculation
ISP_1000 = sqrt(2 * DH_total_pkg_1000) /  G_earth;
ISP_1500 = sqrt(2 * DH_total_pkg_1500) /  G_earth;
ISP_2000 = sqrt(2 * DH_total_pkg_2000) /  G_earth;
ISP_2500 = sqrt(2 * DH_total_pkg_2500) /  G_earth;
ISP_3000 = sqrt(2 * DH_total_pkg_3000) /  G_earth;
ISP_3500 = sqrt(2 * DH_total_pkg_3500) /  G_earth;
ISP_4000 = sqrt(2 * DH_total_pkg_4000) /  G_earth;
ISP_4500 = sqrt(2 * DH_total_pkg_4500) /  G_earth;

% Create ISP array
ISP = [ISP_1000 ISP_1500 ISP_2000 ISP_2500 ISP_3000 ISP_3500 ISP_4000 ISP_4500]

% ISP v Temperature Plot
plot(Temp, ISP);
xlabel('Temperature [K]');
ylabel('ISP [sec]');
title('Plot of ISP vs. Temperature');

