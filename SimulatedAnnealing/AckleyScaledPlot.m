function AckleyScaledPlot

xlimits = [-3 3];
dx = (xlimits(2) - xlimits(1)) / 100;
N = floor((xlimits(2) - xlimits(1)) / dx) + 1;
obj = zeros(N, N);
i = 0;
for x = xlimits(1) : dx : xlimits(2)
    i = i + 1;
    k = 0;
    for y = xlimits(1) : dx : xlimits(2)
        yprime = y / 4;
        k = k + 1;
        sum1 = x^2 + yprime^2;
        sum2 = cos(2*pi*x) + cos(2*pi*yprime);
        obj(i,k) = 20 + exp(1) - 20 * exp(-0.2*sqrt(sum1/2)) - exp(sum2/2);
    end
end
close all;
[x, y] = meshgrid(xlimits(1) : dx : xlimits(2));
meshc(x,y,obj);
xlabel('x2')
ylabel('x1')
zlabel('f ( x1, x2)')
set(gca, 'XTick', [])
set(gca, 'YTick', [])
set(gca, 'ZTick', [])
temp = axis;
axis([xlimits, xlimits, temp(5), max(max(obj))])