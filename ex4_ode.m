%% Example 4: Direction field [ y' = cos(x) cos(y) ]
iex = 4
if iex == 4
    x = [0:0.4:2*pi];
    y = [-pi:0.4:pi];
    arrow_len = 0.2;
    
    figure; hold on
    for ii=1:length(x)
        for jj = 1:length(y)
            dydx = 2 * cos(x(ii)) * cos(y(jj)); % KEY
            % plot
            u = cos(atan(dydx)) * arrow_len; % x-component of arrow
            v = sin(atan(dydx)) * arrow_len; % y-component of arrow
            quiver(x(ii),y(jj),u,v,'k'); % plot arrow
        end
    end
    xlabel('x');
    ylabel('y');
    title('Direction field for $$y'' = 2 cos(x) cos(y)$$','interpreter','latex')
end