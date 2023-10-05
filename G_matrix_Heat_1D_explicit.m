% Solves the 1D heat equation with an explicit finite difference scheme
% 
% From Thorsten Becker's webpage
%

clear all
close all

% Physical parameters
L = 100; % Length of modeled domain [m]
Tmagma = 1200; % Temperature of magma [C]
Trock = 300; % Temperature of country rock [C]
kappa = 1e-6; % Thermal diffusivity of rock [m2/s]
W = 5; % Width of dike [m]
day = 3600*24; % # seconds per day
dt = 1*day; % Timestep [s]

% Numerical parameters
nx = 201; % Number of gridpoints in x-direction
nt = 100; % Number of timesteps to compute
dx = L/(nx-1); % Spacing of grid
x = -L/2:dx:L/2;% Grid

% Setup initial temperature profile

% Taking transpose
TG = (ones(size(x)).')*Trock;
TG(find(abs(x)<=W/2)) = Tmagma;

% finding constant c
c = (kappa*dt)/((dx)^2);

% Initializing G matrix ( to be checked later)
G =  zeros(size(x));


for n=1:nt % Timestep loop
    % Compute new temperature
    
    for i=1:nx
       % Setting Boundary Conditions
       if(i==1 || i==nx)
           G(i,i) = 1;
       else
           G(i,i-1) = c;
           G(i,i+1) = c;
           G(i,i) = 1 - (2*c);
       end
    end
end

 time = 0;

    % Update temperature and time
   for n=1:nt 
       TGnew = G*TG;
       TG = TGnew;
       time = time + dt;
   
    % Plot solution
    figure(1), clf
    plot(x,TGnew);
    Ymat(n,:) = n*dt*(ones(1,nx));
    Xmat(n,:) = x;
    Tmat(n,:) = TGnew;
    axis([-50 50 200 1300])
    xlabel('x [m]')
    ylabel('Temperature [^oC]')
    title(['Temperature evolution after ',num2str(time/day),' days'])
    drawnow
end
figure
surf(Xmat,Ymat,Tmat)