%%


x = [-0.3:.03:0.3];
train_labels = zeros(size(x,1), size(labels,2));
for i = 1:size(labels,2)
   label = labels(i);
   norm = normpdf(x,label,0.03)/sum(normpdf(x,label,0.03));
   [M,Idx] = max(norm);
   train_labels(Idx,i) = 1;
%    plot(x,norm)
%    drawnow;
end

%%
train_data = zeros(1024*3, size(data,2));

for i = 1:size(data,2)
   im = data{i}.cdata;
   im = imresize(im,[32 32]);
   im = im2double(im);
   train_data(:,i) = reshape(im, 1024*3, 1);
end


