function [ Rand ] = Sinus(rows, cols, OPTIONS)
% This chaotic function is defined by equation below
OPTIONS_.x0 = @rand;
if  nargin == 3 && ~isempty(OPTIONS) && isstruct(OPTIONS)
    if isfield(OPTIONS, 'x0'); OPTIONS_.x0 = OPTIONS.x0; end
end
x0 = feval(OPTIONS_.x0);

%% Sinus function
fcn = @ (x0) 2.3 * (x0 ^ (2 * sin(pi * x0)));

%% random generation method
switch nargin
    case 1
        cols = rows;
        Rand = RCs(rows, cols);
    case 2
        Rand = RCs(rows, cols);
    case 3
        Rand = RCs(rows, cols);
    otherwise
        Rand = fcn(x0);
end

    function [ Rands ] = RCs(rows, cols)
        Rands = zeros(rows, cols);
        for j = 1 : cols
            for i = 1 : rows
                Rands(i,j) = fcn(x0);
                x0 = feval(OPTIONS_.x0);
            end
        end
    end

end
