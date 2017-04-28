%% plot weights
N = size(W{1},1);

ax = ceil(sqrt(N));
weights = reshape(W{1},N,32,32);
for i = 1:N
    subplot(ax,ax,i);
    w = squeeze(weights(i,:,:));
    imagesc(w);
    axis image
end