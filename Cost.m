function J = computeCost(X, y, theta)

m = length(y); % ѵ����������
J = 0;
h = X*theta; %Ԥ��ֵ
J=sum((h-y).^2)/(2*m);%���ۺ���

end
