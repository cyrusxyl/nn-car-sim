function [accuracy, loss] = ComputeAccuracyAndLoss(W, b, data, labels)
% [accuracy, loss] = ComputeAccuracyAndLoss(W, b, X, Y) computes the networks
% classification accuracy and cross entropy loss with respect to the data samples
% and ground truth labels provided in 'data' and labels'. The function should return
% the overall accuracy and the average cross-entropy loss.

outputs = Classify(W, b, data);

[N,C] = size(outputs);

[M,class_pred] = max(outputs,[],2);
[M,class_label] = max(labels,[],2);

match = class_pred==class_label;
accuracy = sum(match(:))/length(match(:));


loss = -sum(log(outputs(logical(labels))))/N;
end
