function J = computeCost(X, y, theta)

m = length(y); % 训练样本个数
J = 0;
h = X*theta; %预测值
J=sum((h-y).^2)/(2*m);%代价函数

end
