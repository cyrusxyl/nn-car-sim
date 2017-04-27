function [outputs] = Classify(W, b, data)
% [predictions] = Classify(W, b, data) should accept the network parameters 'W'
% and 'b' as well as an DxN matrix of data sample, where D is the number of
% data samples, and N is the dimensionality of the input data. This function
% should return a vector of size DxC of network softmax output probabilities.
sigmoid = @(x) 1 ./ (1 + exp(-x));

L = length(W)+1;

[D,N] = size(data);

act_a = cell(1,L-1);
act_h = cell(1,L-1);

act_a{1,1} = W{1,1} * data' + b{1,1}*ones(1,D);
act_h{1,1} = sigmoid(act_a{1,1});

for i = 2:L-2
    act_a{1,i} = W{1,i} * act_h{1,i-1} + b{1,i}*ones(1,D);
    act_h{1,i} = sigmoid(act_a{1,i});
end

act_a{1,L-1} = W{1,L-1} * act_h{1,L-2} + b{1,L-1}*ones(1,D);
act_h{1,L-1} = softmax(act_a{1,L-1});

outputs = act_h{1,L-1}';

end
