function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y); % ѵ��������
J_history = zeros(num_iters, 1);%��¼J���ŵ����ı仯
for iter = 1:num_iters
	h=X*theta;
	theta(1)=theta(1)-alpha/m*sum((h-y).*X(:,1));
	theta(2)=theta(2)-alpha/m*sum((h-y).*X(:,2));
    J_history(iter) = computeCost(X, y, theta);
end

end
