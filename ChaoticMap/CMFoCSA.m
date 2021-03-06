function [ Rand ] = CMFoCSA(rows, cols, OPTIONS)
a = 0.9;
b = 5;
% OPTIONS_.x0 = @rand;
OPTIONS_.x0 = @randn;
if  nargin == 3 && ~isempty(OPTIONS) && isstruct(OPTIONS)
    if isfield(OPTIONS, 'a'); a = OPTIONS.a; end
    if isfield(OPTIONS, 'b'); b = OPTIONS.b; end
    if isfield(OPTIONS, 'x0'); OPTIONS_.x0 = OPTIONS.x0; end
end
x0 = feval(OPTIONS_.x0);

%% Circle function
fcn = @ (x0) a * x0 - 2 * tanh(b * x0) * exp(-3 * (x0^2));

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
