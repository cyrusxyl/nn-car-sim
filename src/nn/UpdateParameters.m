function [W, b] = UpdateParameters(W, b, grad_W, grad_b, learning_rate)
% [W, b] = UpdateParameters(W, b, grad_W, grad_b, learning_rate) computes and returns the
% new network parameters 'W' and 'b' with respect to the old parameters, the
% gradient updates 'grad_W' and 'grad_b', and the learning rate.

update = @(x,y) x+learning_rate*y;
W = cellfun(update, W, grad_W, 'UniformOutput', false);
b = cellfun(update, b, grad_b, 'UniformOutput', false);

end

