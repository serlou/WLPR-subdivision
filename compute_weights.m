function w = compute_weights(x,kern)
% w = pesovectorial(x,kern)
% INPUT:    x 1xN matrix with nodes in (-1,1)
%           kern handle function, kern:(-1,1)->[0,1]
%            or string with valid kernel name
% OUTPUT:   w 1xN matrix, weights
%   Copyright (c) 2023 Sergio López-Ureña and Dionisio F. Yáñez

if isa(kern,'function_handle')
    w = kern(x); return
end
switch kern
    case 'rect', w=abs(x)<1;
    case 'tria', w=max(1-abs(x),0);
    case 'epan', w=max(1-x.^2,0);
    case 'bisq', w=max((1-x.^2),0).^2;
    case 'tcub', w=max((1-abs(x).^3).^3,0);
    case 'trwt', w=max((1-x.^2).^3,0);
    case 'sedi', w=max((1-x.^4).^5,0);
    case 'exp3', w=exp(-3.*abs(x));
    otherwise
        error('Provide a valid kernel name or a handle function.')
end
