function [W, b] = Train(W, b, train_data, train_label, learning_rate)
% [W, b] = Train(W, b, train_data, train_label, learning_rate) trains the network
% for one epoch on the input training data 'train_data' and 'train_label'. This
% function should returned the updated network parameters 'W' and 'b' after
% performing backprop on every data sample.


% This loop template simply prints the loop status in a non-verbose way.
% Feel free to use it or discard it
N = size(train_data,1);

L = length(W)+1;
order = randperm(N,N);
batch_grad_W = cell(1,L-1);
batch_grad_b = cell(1,L-1);

for l = 1:L-1
    batch_grad_W{l} = zeros(size(W{l}));
    batch_grad_b{l} = zeros(size(b{l}));
end

for i = 1:N
    X = train_data(order(i),:);
    Y = train_label(order(i),:);
    
    [output, act_h, act_a] = Forward(W, b, X);
    [grad_W, grad_b] = Backward(W, b, X, Y, act_h, act_a);
    
    [W, b] = UpdateParameters(W, b, grad_W, grad_b, learning_rate);
    
%     cellfun(@(x,y) x+y, batch_grad_W, grad_W, 'UniformOutput', false);
%     cellfun(@(x,y) x+y, batch_grad_b, grad_b, 'UniformOutput', false);

    if mod(i, 100) == 0
        waitbar(i/N);
    end
end

% cellfun(@(x) x/N, batch_grad_W, 'UniformOutput', false);
% cellfun(@(x) x/N, batch_grad_b, 'UniformOutput', false);

% [W, b] = UpdateParameters(W, b, batch_grad_W, batch_grad_b, learning_rate);

end
