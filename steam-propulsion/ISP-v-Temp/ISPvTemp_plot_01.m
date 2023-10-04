% Import mole fractions from mole fractions CSV
mole_fract_matrix = csvread("mole_fract.csv");

% Create temperature array from mole fraction matrix
x_Temp = mole_fract_matrix(:,1); 

% Initial temperature value
T_0 = 0; % Kelvin

% Mole Fractions
H2O_mol_fract = mole_fract_matrix(:,2);
HO_mol_fract = mole_fract_matrix(:,3);
H_mol_fract = mole_fract_matrix(:,4);
O_mol_fract = mole_fract_matrix(:,5);
H2_mol_fract = mole_fract_matrix(:,6);
O2_mol_fract = mole_fract_matrix(:,7);

% Define the accuracy/steps
H2O_mol_fract_q = 1000:50:4500;
HO_mol_fract_q = 1000:50:4500;
H_mol_fract_q = 1000:50:4500;
O_mol_fract_q = 1000:50:4500;
H2_mol_fract_q = 1000:50:4500;
O2_mol_fract_q = 1000:50:4500;

% Define new x axis based on steps above
x_Temp_Int = H2O_mol_fract_q;

% Interpolate the function
H2O_mol_fract_ext = interp1(x_Temp, H2O_mol_fract, H2O_mol_fract_q, 'linear');
HO_mol_fract_ext = interp1(x_Temp, HO_mol_fract, HO_mol_fract_q, 'linear');
H_mol_fract_ext = interp1(x_Temp, H_mol_fract, H_mol_fract_q, 'linear');
O_mol_fract_ext = interp1(x_Temp, O_mol_fract, O_mol_fract_q, 'linear');
H2_mol_fract_ext = interp1(x_Temp, H2_mol_fract, H2_mol_fract_q, 'linear');
O2_mol_fract_ext = interp1(x_Temp, O2_mol_fract, O2_mol_fract_q, 'linear');

% Set all H2O NaN mole fraction values to one
H2O_mol_fract_ext(isnan(H2O_mol_fract_ext)) = 1;

% Set all other NaN mole fraction values for other components to zero
HO_mol_fract_ext(isnan(HO_mol_fract_ext)) = 0;
H_mol_fract_ext(isnan(H_mol_fract_ext)) = 0;
O_mol_fract_ext(isnan(O_mol_fract_ext)) = 0;
H2_mol_fract_ext(isnan(H2_mol_fract_ext)) = 0;
O2_mol_fract_ext(isnan(O2_mol_fract_ext)) = 0;

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

% Standard State Enthalpies
H2O_sse = -251730; % J/mol
HO_sse = 30150; % J/mol
H_sse = 211782; % J/mol
O_sse = 242459; % J/mol
H2_sse = -8468; % J/mol
O2_sse = -8682; % J/mol

% Universal Gas Constant
R = 8.31; % J/mol*K

% Earth's Gravity
G_earth = 9.81; % m/s^2

% k values
for i = 1:length(H2O_mol_fract_ext)
    % Value used to calculate the n_t
    k(i) = H2O_mol_fract_ext(i) * m_H2O + ...
        HO_mol_fract_ext(i) * m_HO + ...
        H_mol_fract_ext(i) * m_H + ...
        O_mol_fract_ext(i) * m_O + ...
        H2_mol_fract_ext(i) * m_H2 + ...
        O2_mol_fract_ext(i) * m_O2;
    
    % Total number of moles in mixture
    n_t(i) = m_H2O / k(i);
end


for i = 1:length(H2O_mol_fract_ext)
    % Number of moles preent in each mixture for a given temperature
    n_H2O(i) = H2O_mol_fract_ext(i) * n_t(i);
    n_HO(i) = HO_mol_fract_ext(i) * n_t(i);
    n_H(i) = H_mol_fract_ext(i) * n_t(i);
    n_O(i) = O_mol_fract_ext(i) * n_t(i);
    n_H2(i) = H2_mol_fract_ext(i) * n_t(i);
    n_O2(i) = O2_mol_fract_ext(i) * n_t(i);
end

% Preallocate arrays
dT = zeros(length(n_t));
dn_H2O = zeros(length(n_t));
dn_HO = zeros(length(n_t));
dn_H = zeros(length(n_t));
dn_O = zeros(length(n_t));
dn_H2 = zeros(length(n_t));
dn_O2 = zeros(length(n_t));
ISP = zeros(length(n_t));
q = zeros(length(n_t));
dq_conv = zeros(length(n_t));

% dq values
for i = 1:length(H2O_mol_fract_ext)
    if i == 1
        % Chamge in Temperature from 0 to the interpolated temperature val
        dT(i) = 0;
        
        % Change in number of moles for inital val
        dn_H2O(i) = 0;
        dn_HO(i) = 0;
        dn_H(i) = 0;
        dn_O(i) = 0;
        dn_H2(i) = 0;
        dn_O2(i) = 0;

        q(i) = ((R / (gamma_H2O - 1)) * 1000) / 0.018;

        ISP(i) = sqrt(2 * q(i)) / G_earth;
    else 
        % Chamge in Temperature from 0 to the interpolated temperature val
        dT(i) = x_Temp_Int(i) - x_Temp_Int(i-1);

        % Change in number of moles for each component
        dn_H2O(i) = n_H2O(i) - n_H2O(i-1);
        dn_HO(i) = n_HO(i) - n_HO(i-1);
        dn_H(i) = n_H(i) - n_H(i-1);
        dn_O(i) = n_O(i) - n_O(i-1);
        dn_H2(i) = n_H2(i) - n_H2(i-1);
        dn_O2(i) = n_O2(i) - n_O2(i-1);
    
        % Calculating the energy gain stepwise with temperature
        dq(i) = (((R * n_H2O(i)) / (gamma_H2O - 1)) * dT(i) + dn_H2O(i) * H2O_sse) + ...
        (((R * n_HO(i)) / (gamma_HO - 1)) * dT(i) + dn_HO(i) * HO_sse) + ...
        (((R * n_H(i)) / (gamma_H - 1)) * dT(i) + dn_H(i) * H_sse) + ...
        (((R * n_O(i)) / (gamma_O - 1)) * dT(i) + dn_O(i) * O_sse) + ...
        (((R * n_H2(i)) / (gamma_H2 - 1)) * dT(i) + dn_H2(i) * H2_sse) + ...
        (((R * n_O2(i)) / (gamma_O2 - 1)) * dT(i) + dn_O2(i) * O2_sse);

        dq_conv(i) = dq(i) / 0.018;
        
        q(i) = q(i - 1) + dq_conv(i);

        ISP(i) = sqrt(2 * q(i)) / G_earth;
    end
end

% Plot Component Mole Fractions vs Temperataure
figure
plot(x_Temp,H2O_mol_fract, x_Temp,HO_mol_fract, x_Temp,H_mol_fract, x_Temp,O_mol_fract, x_Temp,H2_mol_fract, x_Temp,O2_mol_fract);
title('Mole Fraction vs Temperature');
xlabel('Temperature [K]');
ylabel('Component Mole Fraction [mol]');
legend({'H2O', 'HO', 'H', 'O', 'H2', 'O2'}, 'Location','southwest');

% Plot ISP vs Temperature
figure
plot(x_Temp_Int, ISP);
title('Specific Impulse (Isp) vs Temperature');
xlabel('Temperature [K]');
ylabel('Specific Impulse [s]');

% Plot Q vs Temperature
figure
plot(x_Temp_Int, q);
title('Energy (Q) vs Temperature');
xlabel('Temperature [K]');
ylabel('Energy [J/Kg]');
