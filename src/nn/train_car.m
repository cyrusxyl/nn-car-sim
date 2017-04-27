%%
num_epoch = 30;
classes = 31;
layers = [32*32, 64, classes];
learning_rate = 0.01;

load('../data/train_data_gray_matlab.mat', 'train_data', 'train_labels');
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
hold on
plot(0:num_epoch,valid_acc)
title('Classification Accuracy')
legend('train acc','valid acc')

figure
plot(0:num_epoch,train_loss)
hold on
plot(0:num_epoch,valid_loss)
title('Network Loss')
legend('train loss','valid loss')
%% test accuracy
[test_acc,test_loss] = ComputeAccuracyAndLoss(W, b, test_data, test_labels);

%% plot weights
weights = reshape(W{1},400,32,32);
weights = permute(weights,[2,3,1]);
weights = reshape(weights,32,32,1,400)+0.5;
montage(weights);