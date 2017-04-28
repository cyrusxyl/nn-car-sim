%%
num_epoch = 50;
classes = 31;
layers = [32*32, 4, classes];
learning_rate = 0.01;

train_data = train_data';
train_labels = train_labels';

[W, b] = InitializeNetwork(layers);

train_acc = zeros(num_epoch+1,1);
train_loss = zeros(num_epoch+1,1)+inf;
%%
for j = 1:num_epoch
    [n_W, n_b] = Train(W, b, train_data, train_labels, learning_rate);
    
    [train_acc(j+1), train_loss(j+1)] = ComputeAccuracyAndLoss(n_W, n_b, train_data, train_labels);
%     [valid_acc(j+1), valid_loss(j+1)] = ComputeAccuracyAndLoss(n_W, n_b, valid_data, valid_labels);
    
    if train_acc(j+1)>train_acc(j) && train_acc(j+1)<train_acc(j)
        learning_rate = learning_rate*1.05;
        W = n_W;
        b = n_b;
    elseif train_loss(j+1)>1.04*train_loss(j)
        learning_rate = learning_rate*0.7;
    else
        learning_rate = learning_rate*0.9;
        W = n_W;
        b = n_b;
    end


    fprintf('Epoch %d - accuracy: %.5f\t loss: %.5f\n', j, train_acc(j+1), train_loss(j+1));
end

%% plot performance stats
figure
plot(0:num_epoch,train_acc)
title('Classification Accuracy')

figure
plot(0:num_epoch,train_loss)
%% test accuracy
[test_acc,test_loss] = ComputeAccuracyAndLoss(W, b, test_data, test_labels);