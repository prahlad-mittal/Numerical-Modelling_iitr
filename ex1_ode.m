% Select example
iex = 2; 

%% Example 1: dy = cos(x)
iex = 1;
if iex == 1
    c = [-15:0.5:50]; % a subsetted range of C (in Reality this could be any real value) - constant of integral
    x = [-5:0.1:5]; % pick x range (function actually extends from -inf to + inf)
    
    dy = @(x) cos(x);
    y = @(x) sin(x);  % KEY
    
    figure; hold on; grid on;
    for ii=1:length(c)
        f = y(x) + c(ii);
        plot(x,f)
    end
    xlabel('x');
    ylabel('y');
    title('dy = cos x');
end




