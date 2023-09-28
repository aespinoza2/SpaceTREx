% Import mole fractions from mole fractions CSV
mole_fract_matrix = csvread("mole_fract.csv");

% Temperature array
x_Temp = mole_fract_matrix(:,1); 

% Mole Fractions
H2O_mol_fract = mole_fract_matrix(:,2);
HO_mol_fract = mole_fract_matrix(:,3);
H_mol_fract = mole_fract_matrix(:,4);
O_mol_fract = mole_fract_matrix(:,5);
H2_mol_fract = mole_fract_matrix(:,6);
O2_mol_fract = mole_fract_matrix(:,7);

% Define the accuracy/steps
H2O_mol_fract_q = 0:50:4500;
HO_mol_fract_q = 0:50:4500;
H_mol_fract_q = 0:50:4500;
O_mol_fract_q = 0:50:4500;
H2_mol_fract_q = 0:50:4500;
O2_mol_fract_q = 0:50:4500;

% Interpolate the function
H2O_mol_fract_ext = interp1(x_Temp, H2O_mol_fract, H2O_mol_fract_q, 'linear');
HO_mol_fract_ext = interp1(x_Temp, HO_mol_fract, HO_mol_fract_q, 'linear');
H_mol_fract_ext = interp1(x_Temp, H_mol_fract, H_mol_fract_q, 'linear');
O_mol_fract_ext = interp1(x_Temp, O_mol_fract, O_mol_fract_q, 'linear');
H2_mol_fract_ext = interp1(x_Temp, H2_mol_fract, H2_mol_fract_q, 'linear');
O2_mol_fract_ext = interp1(x_Temp, O2_mol_fract, O2_mol_fract_q, 'linear');

% Set all NaN values to zero
H2O_mol_fract_ext(isnan(H2O_mol_fract_ext)) = 0;
HO_mol_fract_ext(isnan(HO_mol_fract_ext)) = 0;
H_mol_fract_ext(isnan(H_mol_fract_ext)) = 0;
O_mol_fract_ext(isnan(O_mol_fract_ext)) = 0;
H2_mol_fract_ext(isnan(H2_mol_fract_ext)) = 0;
O2_mol_fract_ext(isnan(O2_mol_fract_ext)) = 0;

% Plot the original mole fractions
% figure
% plot(x_Temp,H2O_mol_fract, 'r');
% hold on
% plot(x_Temp,HO_mol_fract, 'r');
% plot(x_Temp,H_mol_fract, 'r');
% plot(x_Temp,O_mol_fract, 'r');
% plot(x_Temp,H2_mol_fract, 'r');
% plot(x_Temp,O2_mol_fract, 'r');

% Plot the interpolated points
% plot(H2O_mol_fract_q,H2O_mol_fract_ext,'*')
% plot(HO_mol_fract_q,HO_mol_fract_ext,'*')
% plot(H_mol_fract_q,H_mol_fract_ext,'*')
% plot(O_mol_fract_q,O_mol_fract_ext,'*')
% plot(H2_mol_fract_q,H2_mol_fract_ext,'*')
% plot(O2_mol_fract_q,O2_mol_fract_ext,'*')

% Gamma values of water components
gamma_H2O = 1.33;
gamma_HO = 1.4;
gamma_H = 1.67;
gamma_O = 1.67;
gamma_H2 = 1.4;
gamma_O2 = 1.4;

% Molecular weights of water components
m_H2O = 18; % g/mol
m_HO = 17; % g/mol
m_H = 1; % g/mol
m_O = 16; % g/mol
m_H2 = 2; % g/mol
m_O2 = 32; % g/mol

% k-values
for i = 1:length(H2O_mol_fract_ext)
    k(i) = H2O_mol_fract_ext(i) * m_H2O + HO_mol_fract_ext(i) * m_HO + H_mol_fract_ext(i) * m_H + O_mol_fract_ext(i) * m_O + H2_mol_fract_ext(i) * m_H2 + O2_mol_fract_ext(i) * m_O2;
    disp(k(i))

end
