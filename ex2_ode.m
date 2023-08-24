%% Example 2: dy = 2y
iex = 2;
if iex == 2
    c = [-10:1:10]; % a subsetted range of C (in Reality this could be any real value)
    x = [-0.5:0.1:1.5]; % pick x range (function actually extends from -inf to + inf)
    
    y = @(x) exp(2*x); % KEY
    
    figure; hold on; grid on;
    for ii=1:length(c)
        f = y(x) * c(ii);
        %if c(ii)==1
        plot(x,f,'LineWidth',2)
        %end
    end
    xlabel('x');
    ylabel('y');
    title('dy = 2y');
end