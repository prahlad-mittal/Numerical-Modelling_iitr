%% Example 3: Direction field (falling object)
iex = 3;
if iex == 3
    t = [0:0.5:5];   % sec
    v0 = [0:5:50];   % m/s
    gravity = 9.8;   % m/s^2
    air_drag = 0.47; % gamma
    arrow_len = 0.5;
    mass = 1;
    
    figure; hold on
    for ii=1:length(t)
        for jj = 1:length(v0)
            dvdt = gravity - ((air_drag * v0(jj))/mass); % KEY: tangent (derivative)
            % plot
            u = cos(atan(dvdt)) * arrow_len; % x-component of arrow
            v = sin(atan(dvdt)) * arrow_len; % y-component of arrow
            quiver(t(ii),v0(jj),u,v,'k'); % plot arrow 
        end
    end
    xlabel('t');
    ylabel('v');
    title('Direction field for a falling object; $$\frac{dv}{dt} = g - \frac{\gamma v}{m}$$','interpreter','latex')
end