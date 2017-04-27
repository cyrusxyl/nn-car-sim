function [grad_W, grad_b] = Backward(W, b, X, Y, act_h, act_a)
% [grad_W, grad_b] = Backward(W, b, X, Y, act_h, act_a) computes the gradient
% updates to the deep network parameters and returns them in cell arrays
% 'grad_W' and 'grad_b'. This function takes as input:
%   - 'W' and 'b' the network parameters
%   - 'X' and 'Y' the single input data sample and ground truth output vector,
%     of sizes Nx1 and Cx1 respectively
%   - 'act_h' and 'act_a' the network layer pre and post activations when forward
%     forward propogating the input smaple 'X'
L = length(W)+1;

grad_W = cell(1,L-1);
grad_b = cell(1,L-1);

% delta 4
grad_b{1,L-1} = Y'-act_h{1,L};
grad_W{1,L-1} = grad_b{1,L-1}*act_h{1,L-1}';

% delta 3, delta 2
for i = L-2:-1:1
    grad_b{1,i} = (W{1,i+1}'*grad_b{1,i+1}).*(act_h{1,i+1}.*(1-act_h{1,i+1}));
    grad_W{1,i} = grad_b{1,i}*act_h{1,i}';
end
    
end
