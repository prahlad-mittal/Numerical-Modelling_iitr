%% Example 5: Euler's method [ dy/dx = 2x ]
iex = 5
if iex == 5
    % initial condition
    x0 = 0;
    y0 = 4;
    
    % initialize
    x = [0:0.1:2];
    
    % Differential equation and actual solution
    idiff = 1;
    if idiff == 1
        dydx = @(x,y) 2*x;
        y_in = @(x) x.^2; % analytical solution  [ dy/dx = 2x ]
        c = y0 - y_in(x0);
        y = @(x) x.^2 + c;
    elseif idiff == 2
        dydx = @(x,y) -y;
        y_in = @(x) exp(-x);
        c = y0/y_in(x0);
        y = @(x) c*exp(-x) ; % analytical solution  [ dy/dx = -y ]
    end

    % Plot actual solution
    %close all; 
    figure
    plot(x,y(x),'k','LineWidth',2); % plot analytical solution
    hold on
    
    deltax = 0.05; % discretization in x
    
    % Compute numerical solution
    xvec = [x0:deltax:x(end)];
    yvec(1) = y0;
    for ii=1:length(xvec)
        % Apply Euler's method
        yvec(ii+1) = yvec(ii)+ ((dydx(xvec(ii), yvec(ii)))  * deltax) 
        plot(xvec(ii),yvec(ii),'o','MarkerFaceColor','r','MarkerEdgeColor','k')
    end


    %Runge Kutte method (RK4)
    % Initailize x
    deltax = 0.2;
    xvec = [x0:deltax:x(end)];
    yvec(1) = y0;
    
    % Inline functions for k1,k2,k3,k4
    f = dydx;
    k1 = @(x,y) deltax * f(x, y);
    k2 = @(x,y) deltax * f(x+(deltax/2), y+(k1(x,y)/2));
    k3 = @(x,y) deltax * f(x+(deltax/2), y+(k2(x,y)/2));
    k4 = @(x,y) deltax * f(x+(deltax), y+(k3(x,y)));
    poly = @(x,y) (k1(x,y) + 2*k2(x,y) + 2*k3(x,y) + k4(x,y))/6 ;
    
    % loop over x
    % compute y(ii+1)
    for ii=1:length(xvec)
        yvec(ii+1) = yvec(ii) + poly(xvec(ii), yvec(ii))
        plot(xvec(ii),yvec(ii),'o','MarkerFaceColor','c','MarkerEdgeColor','k')
    end
    
    xlabel('x'); ylabel('y');
    title('Euler solution to $\frac{dy}{dx} = -y$','interpreter','latex')
end